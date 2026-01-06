part of 'smart_couch_cubit.dart';

class SmartCouchState extends Equatable {
  final BaseState<List<MessageModel>>? messages;
  final BaseState<UserInfoEntity>? loggedUserDataEntity;
  final BaseState<List<Map<String, dynamic>>>? chatHistory;

  final String? chatId;

  const SmartCouchState({
    this.messages,
    this.loggedUserDataEntity,
    this.chatId, this.chatHistory,
  });

  SmartCouchState copyWith({
    final BaseState<List<MessageModel>>? messages,
    final BaseState<UserInfoEntity>? loggedUserDataEntity,
    BaseState<List<Map<String, dynamic>>>? chatHistory,
    String? chatId,
  }) {
    return SmartCouchState(
      messages: messages ?? this.messages,
      loggedUserDataEntity: loggedUserDataEntity ?? this.loggedUserDataEntity,
          chatHistory: chatHistory ?? this.chatHistory,

      chatId: chatId ?? this.chatId,
    );
  }

  @override
  List<Object?> get props => [
        messages,
        loggedUserDataEntity,
        chatHistory,
        chatId,
      ];
}
