import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_images.dart';
import 'package:shop_flow/core/constants/app_routes.dart';
import 'package:shop_flow/core/constants/app_string.dart';
import 'package:shop_flow/core/constants/app_text_style.dart';
import 'package:shop_flow/core/services/shared_preference_service.dart';

import '../../../../core/enums/app_font_weight.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        SharedPreferenceService.instance.introShown
            ? Navigator.of(
                context,
              ).pushNamedAndRemoveUntil(AppRoutes.loginRoute, (route) => false)
            : Navigator.of(
                context,
              ).pushNamedAndRemoveUntil(AppRoutes.introScreen, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            SvgPicture.asset(AppImages.appLogo),
            SizedBox(height: 16),
            Text(
              AppString.brandName,
              style: AppTextStyle.style(
                fontSize: 28,
                color: AppColor.secondaryColor,
                fontWeight: AppFontWeight.bold,
                height: 1.2149,
                letterSpacing: -0.56,
              ),
            ),
            SizedBox(height: 24),
            Text(
              AppString.description,
              style: AppTextStyle.style(
                fontSize: 14,
                color: AppColor.textSecondaryColor,
                fontWeight: AppFontWeight.regular,
                height: 1.43,
                letterSpacing: -0.56,
              ),
            ),
            SizedBox(height: 32),
            SizedBox(
              height: 32,
              width: 32,
              child: CircularProgressIndicator(
                backgroundColor: AppColor.backgroundGray,
                color: AppColor.primaryColor,
              ),
            ),

            SizedBox(height: 20),
            Container(
              padding: const EdgeInsetsGeometry.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color(0xFFE4E0EF),
              ),
              child: Text(
                AppString.loaderText,
                style: AppTextStyle.style(
                  color: AppColor.textSecondaryColor,
                  fontWeight: AppFontWeight.medium,
                  height: 1.35,
                  letterSpacing: 0.12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
