import 'package:flutter/material.dart';
import 'package:shop_flow/core/constants/app_color.dart';

class CommonProgressBar extends StatelessWidget {
  final num totalCount;
  final num value;
  final Color? progressBarColor;

  const CommonProgressBar({
    super.key,
    required this.totalCount,
    required this.value,
    this.progressBarColor,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: AppColor.homeopathicLavender,
      color: progressBarColor ?? AppColor.primaryColor,
      borderRadius: .circular(50),
      stopIndicatorRadius: 50,
      minHeight: 8,
      value: value.toDouble() / totalCount.toDouble(),
    );
  }
}
