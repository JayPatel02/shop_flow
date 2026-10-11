import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_text_style.dart';

class CommonInputField extends StatelessWidget {
  final TextEditingController textController;
  final TextInputFormatter? inputFormatter;
  final String? Function(String?)? validatorFunction;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final String hintText;
  final bool? isTextArea;
  final int? minLines;
  final int? maxLines;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final bool? secureText;

  const CommonInputField({
    super.key,
    required this.textController,
    required this.hintText,
    this.onTap,
    this.onChanged,
    this.isTextArea,
    this.minLines,
    this.maxLines,
    this.inputFormatter,
    this.validatorFunction,
    this.prefixIcon,
    this.suffixIcon,
    this.secureText
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      inputFormatters: [?inputFormatter],
      minLines: isTextArea == true ? minLines ?? 5 : 1,
      maxLines: isTextArea == true ? maxLines ?? 8 : 1,
      obscureText: secureText ?? false,
      onTap: onTap,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        isDense: false,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.backgroundGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.backgroundGray),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.warningRedColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.warningRedColor),
        ),
        filled: true,
        fillColor: Colors.white,
        prefixIconColor: AppColor.backgroundGray,
        suffixIconColor: AppColor.backgroundGray,
        hintText: hintText,
        hintStyle: AppTextStyle.style(
          fontSize: 14,
          color: AppColor.backgroundGray,
        ),
      ),
      validator: validatorFunction,
    );
  }
}
