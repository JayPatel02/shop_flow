import 'package:flutter/material.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_string.dart';
import 'package:shop_flow/core/constants/app_text_style.dart';
import 'package:shop_flow/core/data/product_detail_modal.dart';
import 'package:shop_flow/features/cart_module/cart_screen/widgets/cart_item_listing_card.dart';
import 'package:shop_flow/features/cart_module/cart_screen/widgets/cart_screen_placeholder.dart';
import 'package:shop_flow/utilities/calculate_checkout_data.dart';
import 'package:shop_flow/utilities/calculate_discounted_price.dart';

class CardScreenView extends StatefulWidget {
  CardScreenView({super.key});

  @override
  State<CardScreenView> createState() => _CardScreenViewState();
}

class _CardScreenViewState extends State<CardScreenView>
    with AutomaticKeepAliveClientMixin {
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
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    var itemCount = productList.length;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          Text(
            AppString.yourCart,
            style: AppTextStyle.style(
              fontWeight: .bold,
              fontSize: 24,
              color: AppColor.textPrimaryColor,
              height: 1.25,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "$itemCount ${AppString.item}",
            style: AppTextStyle.style(
              color: AppColor.textSecondaryColor,
              height: 1.25,
            ),
          ),
          SizedBox(height: 24),

          if (itemCount < 1) CartScreenPlaceholder(),
          if (itemCount > 0)
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  var value = productList[index];

                  return CartItemListingCard(
                    productImage: value.images?.first ?? AppString.dummyImage,
                    productName: value.title ?? "",
                    productColor: AppString.dummyColor,
                    productPrice: getDiscountedPrice(
                      discount: value.discount ?? 0,
                      price: value.price ?? 0,
                    ).toString(),
                    closeFunction: () {
                      setState(() {
                        productList.removeAt(index);
                      });
                    },
                    addProductFunction: () {
                      setState(() {
                        value.quantity = (value.quantity ?? 0) + 1;
                      });
                    },
                    removeProductFunction: () {
                      setState(() {
                        if ((value.quantity ?? 0) > 1) {
                          value.quantity = (value.quantity ?? 0) - 1;
                        }
                      });
                    },
                    productQuantity: value.quantity.toString(),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16);
                },
                itemCount: itemCount,
              ),
            ),
          if (itemCount > 0)
            Center(
              child: TextButton(
                onPressed: () {
                  Map<String , num> values = calculateCheckoutData(productList);
                  showModalBottomSheet(
                    showDragHandle: true,
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 300,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Text(
                                  "Subtotal",
                                  style: AppTextStyle.style(
                                    height: 1.35,
                                    color: AppColor.textLabelColor,
                                  ),
                                ),
                                Text(
                                  "\$ ${values['subtotal']?.toStringAsFixed(2)}",
                                  style: AppTextStyle.style(
                                    fontWeight: .medium,
                                    fontSize: 16,
                                    height: 1.35,
                                    color: AppColor.textPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Text(
                                  "Discount",
                                  style: AppTextStyle.style(
                                    height: 1.35,
                                    color: AppColor.textLabelColor,
                                  ),
                                ),
                                Text(
                                  "-\$${values['discount']?.toStringAsFixed(2)}",
                                  style: AppTextStyle.style(
                                    fontWeight: .medium,
                                    fontSize: 16,
                                    height: 1.35,
                                    color: AppColor.primaryRedColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Text(
                                  "Delivery",
                                  style: AppTextStyle.style(
                                    height: 1.35,
                                    color: AppColor.textLabelColor,
                                  ),
                                ),
                                Text(
                                  "Free",
                                  style: AppTextStyle.style(
                                    fontWeight: .medium,
                                    fontSize: 16,
                                    height: 1.35,
                                    decoration: .lineThrough,
                                    color: AppColor.textLabelColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                            Divider(
                              height: 1,
                              color: AppColor.homeopathicLavender,
                            ),
                            SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: AppTextStyle.style(
                                    fontWeight: .semiBold,
                                    fontSize: 18,
                                    height: 1.35,
                                    color: AppColor.textPrimaryColor,
                                  ),
                                ),
                                Text(
                                  "\$${values['total']?.toStringAsFixed(2)}",
                                  style: AppTextStyle.style(
                                    fontWeight: .bold,
                                    fontSize: 24,
                                    height: 1.35,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor: AppColor.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: .circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                ),
                                child: Text(
                                  "Checkout Now",
                                  style: AppTextStyle.style(
                                    fontSize: 16,
                                    height: 1.35,
                                    fontWeight: .semiBold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColor.secondaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                ),
                child: Text(AppString.proceedToCheckout),
              ),
            ),
        ],
      ),
    );
  }
}
