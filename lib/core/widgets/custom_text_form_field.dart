import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.obscureText,
    this.controller,
    this.validator,
    this.maxLines = 1,
  });

  final String hint;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      controller: controller,
      obscureText: obscureText ?? false,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).required_field;
            } else {
              return null;
            }
          },
      style: AppTextStyles.styleSemiBold(context, AppColors.grayScale950, 13),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.styleBold(context, AppColors.grayScale400, 13),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xFFE6E9E9),
      ),
    );
  }
}
