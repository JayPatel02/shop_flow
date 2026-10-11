import 'package:flutter/material.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_string.dart';
import 'package:shop_flow/core/constants/app_text_style.dart';
import 'package:shop_flow/core/data/product_detail_modal.dart';
import 'package:shop_flow/core/widgets/common_image_view.dart';
import 'package:shop_flow/utilities/calculate_discounted_price.dart';

class ProductListingScreen extends StatefulWidget {
  const ProductListingScreen({super.key});

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  bool isActive = true;

  List<ProductDetailModal> productList = [
    ProductDetailModal(
      images: [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1PWChN3VkiwELJ_pXhCScb76FheIGMZ53j7T7wQKbOlZ59I5szPVMc9Sc&s=10",
      ],
      title: "Product Name",
      price: 299,
      description: "sfndskjfdskjnfkjnfbk",
      discount: 15,
      brandName: "Brand Name",
      avgRating: 4.8,
      totalRating: 120,
      category: Category(name: "tech"),
      stock: 100,
      reviews: [
        CustomerReviews(
          profileImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4W5se-3sXcI-CuvSm5GbPoSk655stnvqEeWyX1M79KA&s=10",
          name: "Test User 1",
          rating: 4.3,
        ),
        CustomerReviews(
          profileImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4W5se-3sXcI-CuvSm5GbPoSk655stnvqEeWyX1M79KA&s=10",
          name: "Test User 2",
          rating: 3.8,
        ),
        CustomerReviews(
          profileImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4W5se-3sXcI-CuvSm5GbPoSk655stnvqEeWyX1M79KA&s=10",
          name: "Test User 3",
          rating: 2.1,
        ),
      ],
    ),
    ProductDetailModal(
      images: [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1PWChN3VkiwELJ_pXhCScb76FheIGMZ53j7T7wQKbOlZ59I5szPVMc9Sc&s=10",
      ],
      title: "Product Name",
      price: 299,
      description: "",
      discount: 25,
      brandName: "Brand Name",
      avgRating: 3.2,
      totalRating: 150,
      stock: 120,
      category: Category(name: "tech"),
      reviews: [
        CustomerReviews(
          profileImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4W5se-3sXcI-CuvSm5GbPoSk655stnvqEeWyX1M79KA&s=10",
          name: "Test User 1",
          rating: 4.3,
        ),
      ],
    ),
    ProductDetailModal(
      images: [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1PWChN3VkiwELJ_pXhCScb76FheIGMZ53j7T7wQKbOlZ59I5szPVMc9Sc&s=10",
      ],
      title: "Product Name",
      price: 299,
      description: "",
      discount: 25,
      avgRating: 3.62,
      totalRating: 300,
      brandName: "Brand Name",
      stock: 3,
      category: Category(name: "tech"),
      reviews: [
        CustomerReviews(
          profileImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4W5se-3sXcI-CuvSm5GbPoSk655stnvqEeWyX1M79KA&s=10",
          name: "Test User 1",
          rating: 3.8,
        ),
        CustomerReviews(
          profileImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4W5se-3sXcI-CuvSm5GbPoSk655stnvqEeWyX1M79KA&s=10",
          name: "Test User 2",
          rating: 1.1,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(vertical: 20, horizontal: 24),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            AppString.myProducts,
            style: AppTextStyle.style(
              fontWeight: .bold,
              fontSize: 24,
              height: 1.25,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisSize: .min,
            children: [
              Text(
                "${productList.length} ${AppString.product}",
                style: AppTextStyle.style(color: AppColor.textLabelColor),
              ),
              SizedBox(width: 4),
              Container(
                height: 2.5,
                width: 2.5,
                decoration: BoxDecoration(
                  shape: .circle,
                  color: AppColor.textLabelColor,
                ),
              ),
              SizedBox(width: 4),
              Text(
                "300 ${AppString.inStock.toLowerCase()}",
                style: AppTextStyle.style(color: AppColor.textLabelColor),
              ),
            ],
          ),
          SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              color: AppColor.paleViolet,
              borderRadius: .circular(12),
            ),
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isActive = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isActive ? Colors.white : Colors.transparent,
                        borderRadius: .circular(8),
                      ),
                      padding: const EdgeInsetsGeometry.symmetric(vertical: 8),
                      child: Center(
                        child: Text(
                          AppString.active,
                          style: AppTextStyle.style(
                            color: isActive
                                ? AppColor.primaryColor
                                : AppColor.textSecondaryColor,
                            fontSize: 16,
                            fontWeight: .semiBold,
                            height: 1.375,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isActive = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isActive ? Colors.transparent : Colors.white,
                        borderRadius: .circular(8),
                      ),
                      padding: const EdgeInsetsGeometry.symmetric(vertical: 8),
                      child: Center(
                        child: Text(
                          AppString.draft,
                          style: AppTextStyle.style(
                            color: isActive
                                ? AppColor.textSecondaryColor
                                : AppColor.primaryColor,
                            fontSize: 16,
                            fontWeight: .semiBold,
                            height: 1.375,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                var value = productList[index];
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: .circular(12),
                  ),
                  child: Row(
                    spacing: 16,
                    children: [
                      CommonImageView(
                        containerHeight: 64,
                        containerWidth: 64,
                        networkImageSource: value.images?.first ?? AppString.dummyImage,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          mainAxisSize: .min,
                          children: [
                            Text(
                              value.title ?? "",
                              style: AppTextStyle.style(
                                fontWeight: .semiBold,
                                fontSize: 18,
                                height: 1.335,
                                color: AppColor.textPrimaryColor,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Text(
                                  "\$${getDiscountedPrice(discount: value.discount ?? 0, price: value.price ?? 0)}",
                                  style: AppTextStyle.style(
                                    fontWeight: .medium,
                                    height: 1.43,
                                    color: AppColor.textSecondaryColor,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsetsGeometry.symmetric(
                                    vertical: 2,
                                    horizontal: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: (value.stock ?? 0 )< 6
                                        ? AppColor.backgroundRedColor
                                        : AppColor.magnolia,
                                    borderRadius: .circular(50),
                                  ),
                                  child: Text(
                                    "${(value.stock ?? 0 )} ${AppString.inStock.toLowerCase()}",
                                    style: AppTextStyle.style(
                                      fontSize: 12,
                                      height: 1.335,
                                      fontWeight: .medium,
                                      color:(value.stock ?? 0 ) < 6
                                          ? AppColor.primaryRedColor
                                          : AppColor.textLabelColor
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.more_vert)
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 12);
              },
              itemCount: productList.length,
            ),
          ),
        ],
      ),
    );
  }
}
