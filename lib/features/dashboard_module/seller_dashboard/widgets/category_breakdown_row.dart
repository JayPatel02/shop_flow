import 'package:flutter/material.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_text_style.dart';

class CategoryBreakdownRow extends StatelessWidget {
  final Color sectionColor;
  final String label;
  final String percentage;

  const CategoryBreakdownRow({
    super.key,
    required this.sectionColor,
    required this.label,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 12,
          width: 12,
          decoration: BoxDecoration(color: sectionColor, shape: .circle),
        ),
        SizedBox(width: 8),
        Text(
          label,
          style: AppTextStyle.style(
            color: AppColor.textSecondaryColor,
            height: 1.3,
          ),
        ),
        Spacer(),
        Text(
          "$percentage%",
          style: AppTextStyle.style(
            color: AppColor.textSecondaryColor,
            fontSize: 16,
            fontWeight: .semiBold,
            height: 1.375,
          ),
        ),
      ],
    );
  }
}
