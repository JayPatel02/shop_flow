import 'package:flutter/material.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_text_style.dart';
import 'package:shop_flow/core/widgets/common_progress_bar.dart';

class SingleRatingProgress extends StatelessWidget {
  final num totalCount;
  final num value;
  final String label;

  const SingleRatingProgress({
    super.key,
    required this.totalCount,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisSize: .min,
        spacing: 12,
        children: [
          SizedBox(
            width: 7,
            child: Center(
              child: Text(
                label,
                style: AppTextStyle.style(
                  fontSize: 12,
                  height: 1.325,
                  fontWeight: .medium,
                  color: AppColor.textPrimaryColor,
                  letterSpacing: 0.12,
                ),
              ),
            ),
          ),
          Icon(Icons.star, color: AppColor.backgroundGray, size: 10),
          Expanded(
            child: CommonProgressBar(totalCount: totalCount, value: value),
          ),
        ],
      ),
    );
  }
}
