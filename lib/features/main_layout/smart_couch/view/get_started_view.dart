import 'package:fitness_app/core/models/button_model.dart';
import 'package:fitness_app/core/routes/routes.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/core/widget/blurred_bg.dart';
import 'package:fitness_app/core/widget/blurred_container.dart';
import 'package:fitness_app/core/widget/custom_button.dart';
import 'package:fitness_app/features/main_layout/smart_couch/view/widgets/smart_couch_header.dart';
import 'package:fitness_app/features/main_layout/smart_couch/view/widgets/history_chat_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStrtedSmartCouchview extends StatefulWidget {
  const GetStrtedSmartCouchview({super.key});

  @override
  State<GetStrtedSmartCouchview> createState() =>
      _GetStrtedSmartCouchviewState();
}

class _GetStrtedSmartCouchviewState extends State<GetStrtedSmartCouchview> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: HistoryChatDrawer(
        onChatSelected: (chatId) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(
            context,
            Routes.chatView,
            arguments: chatId,
          );
        },
      ),
      body: SafeArea(
        child: BlurredBackground(
          imagePath: AppAssets.smartCouchBg,

          child: Column(
            children: [
              SmartCouchHeader(
                chatView: false,
                onHistoryTap: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                },
              ),
              SizedBox(height: 24.h),

              Image.asset(AppAssets.smartCouchAvatar),
              Spacer(),
              BlurredContainer(
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      "How Can I Assist You \nToday?",
                      style: AppTextStyle.extraBold24,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.h),
                    CustomButton(
                      buttonModel: ButtonModel(
                        text: "Get Started",
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.chatView,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              //   Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
