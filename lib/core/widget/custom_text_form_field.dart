// import 'package:flutter/material.dart';

// import '../models/text_field_model.dart';

// class CustomTextFormField extends StatelessWidget {
//   const CustomTextFormField({super.key, required this.textFormFieldModel});
//   final TextFormFieldModel textFormFieldModel;

//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);
//     return TextFormField(
//       readOnly: textFormFieldModel.readOnly,
//       controller: textFormFieldModel.controller,

//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       onChanged: textFormFieldModel.onChanged,
//       validator: textFormFieldModel.validator,
//       obscureText: textFormFieldModel.obscureText,
//       keyboardType: textFormFieldModel.keyboardType,
//       decoration: InputDecoration(
//         labelText: textFormFieldModel.label,
//         labelStyle: theme.textTheme.bodyMedium,
//         hintText: textFormFieldModel.hint,
//         hintStyle: theme.textTheme.bodyMedium,
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: textFormFieldModel.suffixIcon,
//         suffix:textFormFieldModel.suffix,


//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(textFormFieldModel.border ?? 5),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(textFormFieldModel.border ?? 5),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(textFormFieldModel.border ?? 5),
//         ),
//         disabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(textFormFieldModel.border ?? 5),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(textFormFieldModel.border ?? 5),
//         ),
//       ),
//     );
//   }
// }
