import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/core/helper/base_state.dart';
import 'package:fitness_app/domain/entities/responses/auth_entity/user_info_entity.dart';
import 'package:fitness_app/domain/use_cases/auth/get_logged_user_data_use_case.dart';
import 'package:fitness_app/features/main_layout/smart_couch/gemini_service/data/chat_firestore_service.dart';
import 'package:fitness_app/features/main_layout/smart_couch/gemini_service/gemini_firebase_service.dart';
import 'package:fitness_app/features/main_layout/smart_couch/view/widgets/message_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'smart_couch_state.dart';

@injectable
@singleton
class SmartCouchCubit extends Cubit<SmartCouchState> {
  final GeminiFirebaseService _geminiService = GeminiFirebaseService();
  final ChatFirestoreService _firestore = ChatFirestoreService();
  final GetLoggedUserDataUseCase getLoggedUserDataUseCase;
  final TextEditingController promptController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  String userId = '';

  SmartCouchCubit(this.getLoggedUserDataUseCase)
    : super(const SmartCouchState()) {
    init();
  }

  // void _scrollToBottom() {
  //   Future.delayed(const Duration(milliseconds: 100), () {
  //     if (scrollController.hasClients) {
  //       scrollController.animateTo(
  //        0.0,
  //         duration: const Duration(milliseconds: 300),
  //         curve: Curves.easeOut,
  //       );
  //     }
  //   });
  // }

  void init() async {
    await getUserId();
  }

  Future<void> sendMessage() async {
    if (state.messages?.isLoading == true) return;

    final text = promptController.text.trim();
    if (text.isEmpty) return;
          String currentChatId = state.chatId ?? "";


    final userMessage = MessageModel(
      text: text,
      sender: MessageSender.user,
      dateTime: DateTime.now(),
    );

    final currentMessages = List<MessageModel>.from(state.messages?.data ?? []);
    emit(
      state.copyWith(
        chatId: currentChatId,
        messages: BaseState(
          data: [...currentMessages, userMessage],
          isLoading: true,
        ),
      ),
    );

    promptController.clear();
   // _scrollToBottom();
    try {
      if (userId.isEmpty) {
        await getUserId();
      }

      if (currentChatId.isEmpty) {
        currentChatId = await _firestore.createChatSession(userId, text);
        emit(state.copyWith(chatId: currentChatId));
      }

      await _firestore.saveMessage(currentChatId, userMessage);

      final aiText = await _geminiService.getAiResponse(text);

      final aiMessage = MessageModel(
        text: aiText,
        sender: MessageSender.ai,
        dateTime: DateTime.now(),
      );

      await _firestore.saveMessage(currentChatId, aiMessage);

      final finalMessages = List<MessageModel>.from(state.messages?.data ?? [])
        ..add(aiMessage);
      emit(state.copyWith(chatId: currentChatId,messages: BaseState.success(finalMessages)));

     // _scrollToBottom();
      loadHistoryChat();
    } catch (e) {
      emit(
        state.copyWith(
          messages: BaseState.success([
            ...state.messages?.data ?? [],
            MessageModel(
              text: "Error occurred",
              sender: MessageSender.ai,
              dateTime: DateTime.now(),
            ),
          ]),
        ),
      );
    }
  }

  Future<void> getUserId() async {
    emit(state.copyWith(loggedUserDataEntity: BaseState.loading()));
    final result = await getLoggedUserDataUseCase.call();
    switch (result) {
      case ApiSuccessResult<UserInfoEntity>():
        emit(
          state.copyWith(loggedUserDataEntity: BaseState.success(result.data)),
        );
        userId = result.data.id ?? "";
        if (userId.isNotEmpty) {
          await loadHistoryChat();
        }

        return;
      case ApiErrorResult<UserInfoEntity>():
        emit(
          state.copyWith(
            loggedUserDataEntity: BaseState.error(result.errorMessage),
          ),
        );
        return;
    }
  }

  Future<void> loadHistoryChat() async {
    debugPrint("USER ID => $userId");

    if (userId.isEmpty) return;
    debugPrint("USER ID => $userId");

    emit(state.copyWith(chatHistory: BaseState.loading()));
    try {
      final history = await _firestore.getHistory(userId);
      debugPrint("HISTORY LENGTH => ${history.length}");
      debugPrint("HISTORY DATA => $history");
      emit(state.copyWith(chatHistory: BaseState.success(history)));
    } catch (e) {
      emit(state.copyWith(chatHistory: BaseState.error(e.toString())));
    }
  }

  Future<void> openChatFromHistory(String chatId) async {
    emit(state.copyWith(chatId: chatId, messages: BaseState.loading()));

    if (scaffoldKey.currentState?.isEndDrawerOpen ?? false) {
      Navigator.pop(scaffoldKey.currentContext!);
    }

    try {
      final messages = await _firestore.getMessages(chatId);

      emit(state.copyWith(messages: BaseState.success(messages)));
    } catch (e) {
      emit(state.copyWith(messages: BaseState.error("Failed to load chat")));
    }
  }

  @override
  Future<void> close() {
    promptController.dispose();
    return super.close();
  }
}
