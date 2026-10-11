import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_string.dart';
import 'package:shop_flow/core/constants/app_text_style.dart';
import 'package:shop_flow/core/data/product_detail_modal.dart';
import 'package:shop_flow/features/product_module/product_detail/widget/rating_indicator.dart';

class ReviewCard extends StatelessWidget {
  final CustomerReviews? reviewData;

  const ReviewCard({super.key, required this.reviewData});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: .circular(12),
      shadowColor: Colors.black.withAlpha(5),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: .circular(12),
        ),
        child: Column(
          spacing: 12,
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    reviewData?.profileImage ?? AppString.dummyImage,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        reviewData?.name ?? "",
                        style: AppTextStyle.style(
                          color: AppColor.textPrimaryColor,
                          fontWeight: .semiBold,
                          height: 1.375,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMd('en_US')
                            .format(
                              DateTime.parse(
                                reviewData?.creationAt ?? "2000-01-01",
                              ),
                            )
                            .toString(),
                        style: AppTextStyle.style(
                          color: AppColor.textLabelColor,
                          fontWeight: .semiBold,
                          height: 1.375,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12),
                RatingIndicator(rating: reviewData?.rating?.toDouble() ?? 0),
              ],
            ),
            Text(
              reviewData?.reviewText ?? "",
              style: AppTextStyle.style(
                color: AppColor.textSecondaryColor,
                height: 1.43,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
