import 'package:easy_stars/easy_stars.dart';
import 'package:flutter/material.dart';
import 'package:shop_flow/core/constants/app_color.dart';

class RatingIndicator extends StatelessWidget {
  final double rating;

  const RatingIndicator({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return EasyStarsDisplay(
      initialRating: rating,
      readOnly: true,
      filledColor: AppColor.primaryColor,
      allowHalfRating: true,
      emptyColor: AppColor.primaryColor,
      starSize: 15,
      spacing: 0,
    );
  }
}
