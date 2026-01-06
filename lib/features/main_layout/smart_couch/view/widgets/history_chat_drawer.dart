import 'dart:ui';

import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/features/main_layout/smart_couch/view_model/cubit/smart_couch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


typedef ChatSelectedCallback = void Function(String chatId);

class HistoryChatDrawer extends StatefulWidget {
  final ChatSelectedCallback? onChatSelected;
  const HistoryChatDrawer({super.key, this.onChatSelected});

  @override
  State<HistoryChatDrawer> createState() => _HistoryChatDrawerState();
}

class _HistoryChatDrawerState extends State<HistoryChatDrawer> {
  // @override
  // void initState() {
  //   context.read<SmartCouchCubit>().loadChat();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.only(
      bottomLeft: Radius.circular(20),
      topLeft: Radius.circular(20),
    );

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff242424).withOpacity(0.8),
              borderRadius: borderRadius,
            ),
            child: SafeArea(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Previous conversation",
                      style: AppTextStyle.bold20,
                    ),
                  ),
                  SizedBox(height: 24),
                  BlocBuilder<SmartCouchCubit, SmartCouchState>(
                    builder: (context, state) {
                   final historyList = state.chatHistory?.data ?? [];
                   

                      if (state.chatHistory?.isLoading == true) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state.chatHistory?.data != null) {
                        //final historyList = state.chatHistory?.data ?? [];
                        
                        return Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              final chatItem = historyList[index];
                              final title = chatItem['title'] ?? 'No Title';
                              final chatId = chatItem['id'];

                              return TitleOfConversation(
                                title: title,
                                onTap: () {
                                  if (widget.onChatSelected != null) {
                                    widget.onChatSelected!(chatId);
                                  } else {
                                    context.read<SmartCouchCubit>().openChatFromHistory(chatId);
                                  }
                                },
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: const Divider(color: Colors.white12),
                              );
                            },
                            itemCount: historyList.length,
                          ),
                        );
                      }
                      if (state.chatHistory?.errorMessage != null) {
                        return Center(
                          child: Text(state.chatHistory?.errorMessage ?? ""),
                        );
                      } else {
                        return SizedBox.shrink();
                      }

                      // 
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TitleOfConversation extends StatelessWidget {
  const TitleOfConversation({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Icon(Icons.arrow_back_ios, size: 16, color: AppColors.mainColorL),
            Expanded(
              child: Text(
                title,
                style: AppTextStyle.medium12,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
