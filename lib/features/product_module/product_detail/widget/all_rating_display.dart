import 'package:flutter/material.dart';
import 'package:shop_flow/features/product_module/product_detail/widget/single_rating_progress.dart';

class AllRatingDisplay extends StatelessWidget {
  final int totalReviews;
  final Map<String , dynamic> distribution;
  const AllRatingDisplay({super.key , required this.totalReviews , required this.distribution});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      children: [
        SingleRatingProgress(totalCount: totalReviews, value: distribution["5"], label: "5"),
        SingleRatingProgress(totalCount: totalReviews, value: distribution["4"], label: "4"),
        SingleRatingProgress(totalCount: totalReviews, value: distribution["3"], label: "3"),
        SingleRatingProgress(totalCount: totalReviews, value: distribution["2"], label: "2"),
        SingleRatingProgress(totalCount: totalReviews, value: distribution["1"], label: "1"),
      ],
    );
  }
}
