// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../models/button_model.dart';

// class CustomButton extends StatelessWidget {
//   const CustomButton({super.key, required this.buttonModel});
//   final ButtonModel buttonModel;

//   @override
//   Widget build(BuildContext context) {
//     var theme=Theme.of(context);
//     return SizedBox(
//       height:( buttonModel.height ?? 48).h,
//       width:( buttonModel.width ?? double.infinity).w,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: buttonModel.backgroundColor ,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(buttonModel.borderRadius),
//             side: BorderSide(
//               color: buttonModel.backgroundColor != null
//                   ? const Color(0xff022D82)
//                   : Colors.transparent,
//             ),
//           ),
//         ),
//         onPressed: buttonModel.onPressed,

//         child: Text(
//           buttonModel.text,
//           style:
//               buttonModel.textStyle ??
//               theme.textTheme.titleSmall!.copyWith(
//                 color: buttonModel.textColor ?? theme.colorScheme.onPrimary,
//                 fontWeight: FontWeight.w600,
//               ),
//         ),
//       ),
//     );
//   }
// }

