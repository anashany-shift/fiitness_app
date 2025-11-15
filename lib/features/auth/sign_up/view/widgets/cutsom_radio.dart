import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRadio extends StatelessWidget {
  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.title,
    this.onChanged,
  });
  final String value, groupValue, title;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        padding: EdgeInsets.only(left: 16.sp),
      
        
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffD3D3D3).withOpacity(0.2),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.lgihtGray),
        ),
        child: Row(
          children: [
            Text(title, style: AppTextStyle.bold12),
            Spacer(),
            Radio<String>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
                fillColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return AppColors.mainColorL; // لون الدائرة الداخلية عند الاختيار
                  }
                  return AppColors.lgihtGray; // لون border لما يبقى مش مختار
                }
                
                ),
            ),
          ],
        ),
      ),
    );
  }
}