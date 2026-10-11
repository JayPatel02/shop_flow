import 'package:flutter/material.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_text_style.dart';

class StatsCard extends StatelessWidget {
  final Icon headerIcon;
  final Color headerIconBackGroundColor;
  final bool isIncreasing;
  final String headerStatData;
  final String heading;
  final String data;
  final bool isRating;

  const StatsCard({
    super.key,
    required this.headerIcon,
    required this.headerIconBackGroundColor,
    required this.isIncreasing,
    required this.headerStatData,
    required this.heading,
    required this.data,
    this.isRating = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              crossAxisAlignment: .start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: headerIconBackGroundColor,
                    shape: .circle,
                  ),
                  child: headerIcon,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: isIncreasing
                        ? AppColor.backgroundRedColor
                        : AppColor.homeopathicLavender,
                    borderRadius: .circular(50),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  child: Row(
                    mainAxisSize: .min,
                    spacing: 4,
                    children: [
                      Icon(
                        isIncreasing
                            ? Icons.trending_up
                            : Icons.trending_neutral,
                        color: isIncreasing
                            ? AppColor.starColor
                            : AppColor.textLabelColor,
                        size: 20,
                      ),
                      Text(
                        "${(double.tryParse(headerStatData) ?? 0) > 0 == true ? "+" : ""}$headerStatData%",
                        style: AppTextStyle.style(
                          color: isIncreasing
                              ? AppColor.starColor
                              : AppColor.textLabelColor,
                          fontWeight: .medium,
                          fontSize: 12,
                          height: 1.33,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              heading.toUpperCase(),
              style: AppTextStyle.style(
                color: AppColor.textSecondaryColor,
                fontSize: 12,
                height: 1.335,
              ),
            ),
            SizedBox(height: 4),
            if (!isRating)
              Text(
                data,
                style: AppTextStyle.style(
                  color: AppColor.textPrimaryColor,
                  fontSize: 24,
                  height: 1.25,
                  fontWeight: .bold,
                ),
              ),
            if (isRating)
              Text.rich(
                TextSpan(
                  text: data,
                  style: AppTextStyle.style(
                    color: AppColor.textPrimaryColor,
                    fontSize: 24,
                    height: 1.25,
                    fontWeight: .bold,
                  ),
                  children: <InlineSpan>[
                    TextSpan(
                      text: " / 5.0",
                      style: AppTextStyle.style(color: AppColor.textLabelColor),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
