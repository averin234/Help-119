import 'package:flutter/material.dart';
import 'package:kreki119/app/core/values/app_colors.dart';
import 'package:kreki119/app/core/values/app_values.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomTextField extends StatelessWidget {

  final String hintText;
  final TextFieldType keyboardType;
  final TextEditingController? controller;
  ///default is true
  final bool? isValidationRequired;
  final bool? readOnly;
  final int? maxLength;

  final Function()? onTap;

  const CustomTextField({Key? key,
    required this.hintText,
    required this.keyboardType,
    this.isValidationRequired = true,
    this.readOnly,
    this.controller,
    this.maxLength,
    this.onTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return t11EditTextStyle(hintText, keyboardType, controller: controller);
  }


  Widget t11EditTextStyle(var hintText, TextFieldType keyboardType, {TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(hintText),
        AppValues.smallPadding.toInt().height,
        AppTextField(
          controller: controller,
          textFieldType: keyboardType,
          isValidationRequired: isValidationRequired,
          readOnly: readOnly,
          validator: keyboardType == TextFieldType.MULTILINE ? applyValidation() : null,
          onTap: onTap,
          maxLength: maxLength,
          errorThisFieldRequired: "Data ini harus diisi",
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20, 14, 4, 14),
            hintText: hintText,
            hintStyle: secondaryTextStyle(),
            filled: true,
            fillColor: white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppValues.radius_6),
              borderSide: const BorderSide(color: AppColors.textFieldColor, width: 0.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppValues.radius_6),
              borderSide: const BorderSide(color: AppColors.textFieldColor, width: 0.0),
            ),
          ),
        ),
      ],
    );
  }

  static FormFieldValidator<String>? applyValidation() {
    return (s) {
      if (s!.trim().isEmpty) {
        return "Data ini harus diisi";
      }

      return null;
    };
  }
}
