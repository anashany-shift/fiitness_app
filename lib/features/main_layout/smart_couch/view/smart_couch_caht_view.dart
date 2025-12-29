import 'package:fitness_app/core/models/text_form_filed.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/widget/blurred_bg.dart';
import 'package:fitness_app/core/widget/custom_text_form_field.dart';
import 'package:fitness_app/features/main_layout/smart_couch/gemini_service/gemini_firebase_service.dart';
import 'package:fitness_app/features/main_layout/smart_couch/view/widgets/bubble_chat.dart';
import 'package:fitness_app/features/main_layout/smart_couch/view/widgets/history_chat_drawer.dart';
import 'package:fitness_app/features/main_layout/smart_couch/view/widgets/message_model.dart';
import 'package:fitness_app/features/main_layout/smart_couch/view/widgets/smart_couch_header.dart';
import 'package:fitness_app/features/main_layout/smart_couch/view_model/cubit/smart_couch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmartCouchCahtView extends StatefulWidget {
  const SmartCouchCahtView({super.key});

  @override
  State<SmartCouchCahtView> createState() => _SmartCouchCahtViewState();
}

class _SmartCouchCahtViewState extends State<SmartCouchCahtView> {
  // @override
  // void initState() {
  //   context.read<SmartCouchCubit>().loadChat();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SmartCouchCubit>();
    return Scaffold(
      key: cubit.scaffoldKey,
      endDrawer: const HistoryChatDrawer(),
      body: SafeArea(
        child: BlurredBackground(
          imagePath: AppAssets.smartCouchBg,
          child: Column(
            children: [
              SmartCouchHeader(
                chatView: true,
                onHistoryTap: (){
                    cubit.scaffoldKey.currentState?.openEndDrawer();
                    cubit.loadHistoryChat();
                    
                    }
              ),

              Expanded(
                child: BlocBuilder<SmartCouchCubit, SmartCouchState>(
                  builder: (context, state) {
                    final messages = (state.messages?.data ?? []).reversed
                        .toList();
                    final isLoading = state.messages?.isLoading ?? false;

                    if (messages.isEmpty && !isLoading) {
                      return const Center(
                        child: Text("Start chatting with Smart Coach!"),
                      );
                    }

                    return ListView.builder(
                      reverse: true,
                      controller: cubit.scrollController,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      itemCount: messages.length + (isLoading ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (isLoading && index == 0) {
                          return const BubbleChat(
                            isAi: true,
                            text: "",
                            isAiLoading: true,
                          );
                        }

                        final messageIndex = isLoading ? index - 1 : index;
                        final message = messages[messageIndex];
                        return BubbleChat(
                          isAiLoading: false,
                          text: message.text,
                          isAi: message.sender == MessageSender.ai,
                        );
                      },
                    );
                    
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                child: Builder(
                  builder: (context) {
                    return CustomTextFormField(
                      textFormFieldModel: TextFormFieldModel(
                        controller: cubit.promptController,
                        isAiChat: true,
                        keyboardType: TextInputType.multiline,
                        hint: "what you need? ",
                        suffixIcon: IconButton(
                          icon: Icon(Icons.send, color: AppColors.mainColorL),
                          onPressed: ()  {
                            cubit.sendMessage();
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
