import 'package:flutter/material.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_string.dart';
import 'package:shop_flow/core/constants/app_text_style.dart';
import 'package:shop_flow/core/data/product_detail_modal.dart';
import 'package:shop_flow/core/widgets/common_quantity_add_button.dart';
import 'package:shop_flow/features/product_module/product_detail/widget/image_carousel.dart';
import 'package:shop_flow/features/product_module/product_detail/widget/rating_card.dart';
import 'package:shop_flow/features/product_module/product_detail/widget/rating_indicator.dart';
import 'package:shop_flow/features/product_module/product_detail/widget/review_card.dart';
import 'package:shop_flow/utilities/calculate_discounted_price.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ProductDetailModal? userDetails;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(((_) {
      userDetails =
      ModalRoute.of(context)!.settings.arguments as ProductDetailModal;
      setState(() {
      });
    }));
  }

  int _quantity = 1;
  bool isAllReviewsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      userDetails == null ?
          CircularProgressIndicator()
      : SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: .start,
            children: [
              ImageCarousel(
                imageList: userDetails?.images,
                onClick: () {
                  setState(() {
                    userDetails?.isFavourite =
                        !(userDetails?.isFavourite ?? false);
                  });
                },
                isFavourite: userDetails?.isFavourite ?? false,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      userDetails?.brandName ?? "",
                      style: AppTextStyle.style(
                        color: AppColor.textLabelColor,
                        fontSize: 12,
                        height: 1.25,
                        fontWeight: .medium,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      userDetails?.title ?? "",
                      style: AppTextStyle.style(
                        color: AppColor.textPrimaryColor,
                        fontSize: 24,
                        height: 1.25,
                        fontWeight: .bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      spacing: 12,
                      children: [
                        RatingIndicator(
                          rating: userDetails?.avgRating?.toDouble() ?? 0,
                        ),
                        Text(
                          "${userDetails?.avgRating} (${userDetails?.reviews?.length} reviews)",
                          style: AppTextStyle.style(
                            color: AppColor.textLabelColor,
                          ),
                        ),
                        Container(
                          height: 4,
                          width: 4,
                          decoration: BoxDecoration(
                            color: AppColor.backgroundGray,
                            shape: .circle,
                          ),
                        ),
                        if ((userDetails?.stock ?? 0) > 0)
                          Container(
                            decoration: BoxDecoration(
                              color: AppColor.secondaryColor,
                              borderRadius: .circular(50),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 8,
                            ),
                            child: Text(
                              AppString.inStock,
                              style: AppTextStyle.style(
                                color: Colors.white,
                                fontWeight: .medium,
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: .start,
                      spacing: 12,
                      children: [
                        Text(
                          (userDetails?.discount ?? 0) > 0
                              ? "\$${getDiscountedPrice(discount: userDetails?.discount ?? 0, price: userDetails?.price ?? 0)}"
                              : "\$${userDetails?.price.toString()}",
                          style: AppTextStyle.style(
                            fontSize: 24,
                            fontWeight: .bold,
                            color: AppColor.textPrimaryColor,
                            height: 1.325,
                          ),
                        ),
                        if ((userDetails?.discount ?? 0) > 0)
                          Text(
                            "\$${userDetails?.price}",
                            style: AppTextStyle.style(
                              fontSize: 16,
                              fontWeight: .semiBold,
                              color: AppColor.textLabelColor,
                              height: 1.325,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        if ((userDetails?.discount ?? 0) > 0)
                          Container(
                            padding: const EdgeInsetsGeometry.symmetric(
                              vertical: 2,
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.starColor,
                              borderRadius: .circular(50),
                            ),
                            child: Text(
                              "Save \$${(userDetails?.price ?? 0) - getDiscountedPrice(discount: userDetails?.discount ?? 0, price: userDetails?.price ?? 0)}",
                              style: AppTextStyle.style(
                                fontSize: 12,
                                fontWeight: .regular,
                                color: Colors.white,
                                height: 1.25,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                color: AppColor.homeopathicLavender,
                thickness: 1,
                height: 1,
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      AppString.quantity,
                      style: AppTextStyle.style(
                        fontWeight: .semiBold,
                        fontSize: 18,
                        color: AppColor.textPrimaryColor,
                      ),
                    ),
                    CommonQuantityAddButton(
                      addFunction: () {
                        setState(() {
                          ++_quantity;
                        });
                      },
                      deleteFunction: () {
                        if (_quantity > 1) {
                          setState(() {
                            --_quantity;
                          });
                        }
                      },
                      value: _quantity.toString(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Divider(
                color: AppColor.homeopathicLavender,
                thickness: 1,
                height: 1,
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ExpansionTile(
                  title: Text(
                    AppString.productDescription,
                    style: AppTextStyle.style(
                      fontWeight: .semiBold,
                      fontSize: 18,
                      color: AppColor.textPrimaryColor,
                    ),
                  ),
                  shape: RoundedRectangleBorder(side: BorderSide.none),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  splashColor: Colors.transparent,
                  minTileHeight: 0,
                  tilePadding: EdgeInsets.zero,
                  childrenPadding: const EdgeInsets.all(8),
                  children: [
                    Align(
                      alignment: .topStart,
                      child: Text(
                        userDetails?.description ?? "",
                        textAlign: .start,
                        style: AppTextStyle.style(
                          color: AppColor.textSecondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Divider(
                color: AppColor.homeopathicLavender,
                thickness: 1,
                height: 1,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: AppColor.magnolia,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    SizedBox(height: 24),
                    Text(
                      AppString.customersReview,
                      style: AppTextStyle.style(
                        fontWeight: .semiBold,
                        fontSize: 18,
                        color: AppColor.textPrimaryColor,
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        RatingCard(
                          rating: userDetails?.avgRating?.toDouble() ?? 0,
                          totalReview:
                              userDetails?.reviews?.length.toString() ?? "0",
                        ),
                        SizedBox(width: 24),
                        // Expanded(
                        //   child: AllRatingDisplay(
                        //     totalReviews: demoData['reviewCount'],
                        //     distribution: demoData['reviews']['distribution'],
                        //   ),
                        // ),
                      ],
                    ),
                    ListView.separated(
                      itemCount: isAllReviewsVisible
                          ? userDetails?.reviews?.length ?? 2
                          : (userDetails?.reviews?.length ?? 0) < 2
                          ? 1
                          : 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ReviewCard(
                          reviewData: userDetails?.reviews![index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 16);
                      },
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            isAllReviewsVisible = !isAllReviewsVisible;
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColor.magnolia,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: .circular(50),
                            side: BorderSide(
                              color: AppColor.backgroundGray,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Text(
                          isAllReviewsVisible
                              ? AppString.viewLessReviews
                              : AppString.viewAllReviews,
                          style: AppTextStyle.style(
                            fontSize: 16,
                            fontWeight: .semiBold,
                            color: AppColor.textPrimaryColor,
                            height: 1.325,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 85,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            mainAxisSize: .min,
            children: [
              Column(
                crossAxisAlignment: .center,
                children: [
                  Text(
                    AppString.totalPrice,
                    style: AppTextStyle.style(
                      color: AppColor.textLabelColor,
                      fontWeight: .medium,
                      fontSize: 12,
                      height: 1.35,
                    ),
                  ),
                  Text(
                    (userDetails?.discount ?? 0) > 0
                        ? "\$${getDiscountedPrice(discount: userDetails?.discount ?? 0, price: userDetails?.price ?? 0)}"
                        : "\$${userDetails?.price.toString()}",
                    style: AppTextStyle.style(
                      fontSize: 18,
                      fontWeight: .semiBold,
                      color: AppColor.textPrimaryColor,
                      height: 1.325,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20),
              Expanded(
                child: TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    foregroundColor: Colors.white,
                    iconSize: 20,
                    textStyle: AppTextStyle.style(
                      fontSize: 18,
                      height: 1.35,
                      fontWeight: .semiBold,
                    ),
                  ),
                  label: Text(AppString.addToCart),
                  icon: Icon(Icons.shopping_cart_outlined),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
