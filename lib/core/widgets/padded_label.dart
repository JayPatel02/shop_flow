import 'package:flutter/material.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_text_style.dart';

class PaddedLabel extends StatelessWidget {
  final String label;
  final bool? isRequired;

  const PaddedLabel({super.key, required this.label, this.isRequired = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(left: 8),
      child: Align(
        alignment: .centerStart,
        child: RichText(
          textAlign: .start,
          text: TextSpan(
            text: label,
            style: AppTextStyle.style(
              color: AppColor.textSecondaryColor,
              fontWeight: .medium,
              fontSize: 12,
              height: 1.33,
              letterSpacing: 0.5,
            ),
            children: <TextSpan>[
              if(isRequired ?? false)
                TextSpan(
                  text: " *",
                  style: AppTextStyle.style(
                    color: AppColor.textRedColor,
                    fontWeight: .medium,
                    fontSize: 12,
                    height: 1.33,
                    letterSpacing: 0.5,
                  ),
                )
            ]
          ),
        ),
      ),
    );
  }
}
