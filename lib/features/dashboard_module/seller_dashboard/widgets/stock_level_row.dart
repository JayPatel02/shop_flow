import 'package:flutter/material.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_text_style.dart';
import 'package:shop_flow/core/widgets/common_progress_bar.dart';

class StockLevelRow extends StatelessWidget {
  final String label;
  final int count;
  final double totalCount;
  final Color progressbarColor;

  const StockLevelRow({
    super.key,
    required this.label,
    required this.count,
    required this.totalCount,
    required this.progressbarColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              label,
              style: AppTextStyle.style(
                fontWeight: .medium,
                fontSize: 12,
                height: 1.335,
                color: count < 200 ? AppColor.starColor : AppColor.textPrimaryColor,
              ),
            ),
            Text(
              count.toString(),
              style: AppTextStyle.style(
                fontWeight: .medium,
                fontSize: 12,
                height: 1.335,
                color: count < 200 ? AppColor.starColor : AppColor.textPrimaryColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        CommonProgressBar(totalCount: totalCount, value: count , progressBarColor: progressbarColor,),
        SizedBox(height: 12,)
      ],
    );
  }
}
