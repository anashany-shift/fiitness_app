import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key,  this.title, this.onTap});
  final String? title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap!();
            } else {
              Navigator.pop(context);
            }
          },

          child: const Icon(Icons.arrow_back_ios_new),
        ),
        SizedBox(width: 4.w),
        Text(title??'', style: theme.textTheme.titleLarge),
      ],
    );
  }
}
