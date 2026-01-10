import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/features/main_layout/smart_couch/view_model/cubit/smart_couch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SmartCouchHeader extends StatelessWidget {
  const SmartCouchHeader({
    super.key,
    this.onHistoryTap,
    required this.chatView,
  });
  final void Function()? onHistoryTap;
  final bool chatView;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          SizedBox(
            height: 20.h,
            width: 20.w,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(AppAssets.backIcon),
            ),
          ),
          chatView
              ? Text("Smart Couch", style: AppTextStyle.bold20)
              : BlocSelector<SmartCouchCubit, SmartCouchState, String>(
                  selector: (state) {
                    return state.loggedUserDataEntity?.data?.firstName??"";
                  },
                  builder: (context, userName) {
                    return Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Hi, $userName\n",
                            style: AppTextStyle.medium16,
                          ),
                          TextSpan(
                            text: "I'm Your Smart Couch,",
                            style: AppTextStyle.medium18,
                          ),
                        ],
                      ),
                    );
                  },
                ),
          IconButton(onPressed: onHistoryTap, icon: Icon(Icons.list)),
        ],
      ),
    );
  }
}
