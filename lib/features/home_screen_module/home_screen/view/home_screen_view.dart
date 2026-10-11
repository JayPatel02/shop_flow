import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_images.dart';
import 'package:shop_flow/core/constants/app_routes.dart';
import 'package:shop_flow/core/constants/app_string.dart';
import 'package:shop_flow/core/constants/app_text_style.dart';
import 'package:shop_flow/core/data/product_detail_modal.dart';
import 'package:shop_flow/core/widgets/common_heart_button.dart';
import 'package:shop_flow/core/widgets/common_image_view.dart';
import 'package:shop_flow/utilities/calculate_discounted_price.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> filters = [
    "All",
    "Tech",
    "Fashion",
    "Home",
    "Beauty",
    "Electronics",
  ];

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
          rating: 4.3
        ),
        CustomerReviews(
            profileImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4W5se-3sXcI-CuvSm5GbPoSk655stnvqEeWyX1M79KA&s=10",
            name: "Test User 2",
            rating: 3.8
        ),
        CustomerReviews(
            profileImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4W5se-3sXcI-CuvSm5GbPoSk655stnvqEeWyX1M79KA&s=10",
            name: "Test User 3",
            rating: 2.1
        )
      ]
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
              rating: 4.3
          ),
        ]
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
              rating: 3.8
          ),
          CustomerReviews(
              profileImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4W5se-3sXcI-CuvSm5GbPoSk655stnvqEeWyX1M79KA&s=10",
              name: "Test User 2",
              rating: 1.1
          )
        ]
    ),
  ];

  String _selectedFilter = 'all';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: RefreshIndicator(
        child: Column(
          children: [
            SizedBox(
              height: 35,
              child: ListView.separated(
                scrollDirection: .horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedFilter = filters[index].toLowerCase();
                      });
                    },
                    child: Container(
                      padding: const EdgeInsetsGeometry.symmetric(
                        vertical: 9,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: _selectedFilter == filters[index].toLowerCase()
                            ? AppColor.primaryColor
                            : AppColor.backgroundWhite,
                        borderRadius: BorderRadius.circular(50),
                        border: BoxBorder.all(color: AppColor.textLabelColor),
                      ),
                      child: Text(
                        filters[index],
                        style: AppTextStyle.style(
                          fontWeight: .medium,
                          fontSize: 12,
                          height: 1.325,
                          letterSpacing: 0.12,
                          color: _selectedFilter == filters[index].toLowerCase()
                              ? Colors.white
                              : AppColor.textSecondaryColor,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 12);
                },
                itemCount: filters.length,
              ),
            ),
            SizedBox(height: 28),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: .63,
                ),
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  var value = productList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.viewProduct , arguments: value);
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsetsGeometry.all(12),
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Stack(
                              children: [
                                CommonImageView(
                                  containerHeight: 143,
                                  networkImageSource:
                                      value.images?.first ??
                                      AppString.dummyImage,
                                ),
                                Positioned(
                                  right: 8,
                                  top: 8,
                                  child: CommonHeartButton(
                                    value: value.isFavourite ?? false,
                                    onClick: (){
                                      setState(() {
                                        value.isFavourite = !(value.isFavourite ?? false) ;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Text(
                              value.category?.name ?? "",
                              style: AppTextStyle.style(
                                fontSize: 12,
                                fontWeight: .regular,
                                color: AppColor.textLabelColor,
                                height: 1.325,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              value.brandName ?? "",
                              overflow: .ellipsis,
                              style: AppTextStyle.style(
                                fontSize: 14,
                                fontWeight: .regular,
                                color: AppColor.textPrimaryColor,
                                height: 1.325,
                              ),
                            ),
                            Text(
                              value.title ?? "",
                              overflow: .ellipsis,
                              style: AppTextStyle.style(
                                fontWeight: .regular,
                                color: AppColor.textPrimaryColor,
                                height: 1.325,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: .start,
                              spacing: 4,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppColor.starColor,
                                  size: 12,
                                ),
                                Text(
                                  value.avgRating.toString(),
                                  style: AppTextStyle.style(
                                    fontSize: 12,
                                    fontWeight: .medium,
                                    color: AppColor.textPrimaryColor,
                                    height: 1.325,
                                  ),
                                ),
                                Text(
                                  "(${value.totalRating.toString()})",
                                  style: AppTextStyle.style(
                                    fontSize: 12,
                                    fontWeight: .medium,
                                    color: AppColor.textLabelColor,
                                    height: 1.325,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: .start,
                              spacing: 8,
                              children: [
                                Text(
                                  value.discount! > 0
                                      ? "\$${getDiscountedPrice(discount: value.discount ?? 0, price: value.price ?? 0)}"
                                      : "\$${value.price.toString()}",
                                  style: AppTextStyle.style(
                                    fontSize: 18,
                                    fontWeight: .semiBold,
                                    color: AppColor.textPrimaryColor,
                                    height: 1.325,
                                  ),
                                ),
                                if (value.discount! > 0)
                                  Text(
                                    "\$${value.price}",
                                    style: AppTextStyle.style(
                                      fontSize: 12,
                                      fontWeight: .medium,
                                      color: AppColor.textPrimaryColor,
                                      height: 1.325,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                if (value.discount! > 0)
                                  Container(
                                    padding: const EdgeInsetsGeometry.symmetric(
                                      vertical: 2,
                                      horizontal: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColor.primaryRedColor,
                                      borderRadius: .circular(50),
                                    ),
                                    child: Text(
                                      "-${value.discount}%",
                                      style: AppTextStyle.style(
                                        fontSize: 10,
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
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        onRefresh: () {
          return Future.delayed(Duration());
        },
      ),
    );
  }
}
