import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/features/main_layout/smart_couch/view/widgets/typing_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpt_markdown/gpt_markdown.dart';

class BubbleChat extends StatelessWidget {
  const BubbleChat({
    super.key,
    required this.isAi,
    required this.text,
    required this.isAiLoading,
  });
  final bool isAi;
  final bool isAiLoading;
  final String text;
  @override
  Widget build(BuildContext context) {
    return isAi ? buildAiMessage(context) : buildUserMessage(context);
  }

  Widget buildAiMessage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16, left: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 15, backgroundImage: AssetImage(AppAssets.smartCouchAvatar)),
          SizedBox(width: 8.w),

          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xff242424).withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: isAiLoading
                      ? const JumpingDots() // لو بيحمل اظهر النقط
                      : GptMarkdown(text, style: AppTextStyle.regular18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUserMessage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16, right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xffff6a00).withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    text,
                    style: AppTextStyle.regular18,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(AppAssets.perosn),
          ),
        ],
      ),
    );
  }
}
