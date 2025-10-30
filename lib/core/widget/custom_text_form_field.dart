import 'package:fitness_app/core/models/text_form_filed.dart';
import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.textFormFieldModel});
  final TextFormFieldModel textFormFieldModel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: textFormFieldModel.readOnly,
      controller: textFormFieldModel.controller,

      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: textFormFieldModel.onChanged,
      validator: textFormFieldModel.validator,
      obscureText: textFormFieldModel.obscureText,
      keyboardType: textFormFieldModel.keyboardType,
      decoration: InputDecoration(
        hintText: textFormFieldModel.hint,
        prefixIcon: textFormFieldModel.preSuffix,
        suffixIcon: textFormFieldModel.suffixIcon,
        suffix:textFormFieldModel.suffix,

      )
    );
  }
}
