import 'package:flutter/material.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_text_style.dart';
import 'package:shop_flow/features/product_module/product_detail/widget/rating_indicator.dart';

class RatingCard extends StatelessWidget {
  final double rating;
  final String totalReview;
  const RatingCard({super.key , required this.rating , required this.totalReview});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 4,
        children: [
          Text(
            rating.toString(),
            style: AppTextStyle.style(
              fontSize: 28,
              fontWeight: .bold,
              height: 1.215,
            ),
          ),
          RatingIndicator(rating: rating),
          Text(
            "$totalReview total",
            style: AppTextStyle.style(
              fontSize: 12,
              fontWeight: .medium,
              height: 1.25,
              color: AppColor.textLabelColor,
            ),
          ),
        ],
      ),
    );
  }
}
