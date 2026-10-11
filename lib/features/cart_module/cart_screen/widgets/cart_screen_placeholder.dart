import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_images.dart';
import 'package:shop_flow/core/constants/app_string.dart';
import 'package:shop_flow/core/constants/app_text_style.dart';

class CartScreenPlaceholder extends StatelessWidget {
  const CartScreenPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
      child: Center(
        child: Column(
          mainAxisSize: .min,
          mainAxisAlignment: .center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.primaryColor.withAlpha(35),
                    blurRadius: 70,
                  ),
                ],
              ),
              child: SvgPicture.asset(
                AppImages.cartScreenPlaceholder,
                fit: .scaleDown,
                height: 250,
                width: 250,
              ),
            ),
            SizedBox(height: 24),
            Text(
              AppString.yourCartIsEmpty,
              style: AppTextStyle.style(
                color: AppColor.textPrimaryColor,
                fontWeight: .bold,
                fontSize: 24,
                height: 1.25,
              ),
            ),
            SizedBox(height: 8),
            Text(
              AppString.cartEmptyDescription,
              textAlign: .center,
              style: AppTextStyle.style(
                color: AppColor.textSecondaryColor,
                height: 1.35,
              ),
            ),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: AppColor.secondaryColor,
                  shape: RoundedRectangleBorder(borderRadius: .circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 12)
                ),
                child: Text(
                  AppString.startShopping,
                  style: AppTextStyle.style(
                    fontSize: 16,
                    height: 1.35,
                    fontWeight: .semiBold,
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
