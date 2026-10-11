import 'package:flutter/material.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_text_style.dart';
import 'package:shop_flow/core/widgets/common_image_view.dart';
import 'package:shop_flow/core/widgets/common_quantity_add_button.dart';

class CartItemListingCard extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productColor;
  final String productPrice;
  final String productQuantity;
  final VoidCallback closeFunction;
  final VoidCallback addProductFunction;
  final VoidCallback removeProductFunction;

  const CartItemListingCard({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productColor,
    required this.productPrice,
    required this.closeFunction,
    required this.addProductFunction,
    required this.removeProductFunction,
    required this.productQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          spacing: 16,
          mainAxisAlignment: .spaceBetween,
          children: [
            SizedBox(
              height: 70,
              width: 70,
              child: CommonImageView(
                containerHeight: 80,
                networkImageSource: productImage,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                mainAxisSize: .min,
                spacing: 8,
                children: [
                  Text(
                    productName,
                    overflow: .ellipsis,
                    style: AppTextStyle.style(
                      fontWeight: .semiBold,
                      fontSize: 16,
                      height: 1.35,
                      color: AppColor.textPrimaryColor,
                    ),
                  ),
                  Text(
                    productColor,
                    style: AppTextStyle.style(
                      color: AppColor.textSecondaryColor,
                      height: 1.35,
                    ),
                  ),
                  Text(
                    "\$$productPrice",
                    style: AppTextStyle.style(
                      fontWeight: .semiBold,
                      fontSize: 18,
                      height: 1.35,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .end,
              mainAxisSize: .min,
              children: [
                IconButton(
                  onPressed: closeFunction,
                  icon: Icon(
                    Icons.close,
                    size: 22,
                    color: AppColor.textLabelColor,
                  ),
                ),
                CommonQuantityAddButton(
                  addFunction: addProductFunction,
                  deleteFunction: removeProductFunction,
                  value: productQuantity,
                  isSmall: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
