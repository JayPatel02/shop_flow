import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_images.dart';
import 'package:shop_flow/core/constants/app_routes.dart';
import 'package:shop_flow/core/constants/app_string.dart';
import 'package:shop_flow/core/constants/app_text_style.dart';
import 'package:shop_flow/core/services/shared_preference_service.dart';

class IntroCarousel extends StatefulWidget {
  const IntroCarousel({super.key});

  @override
  State<IntroCarousel> createState() => _IntroCarouselState();
}

class _IntroCarouselState extends State<IntroCarousel> {
  late int _currentIndex = 0;

  final PageController _introPageController = PageController();

  final List<Map<String, String>> introData = [
    {
      'image': AppImages.firstStepperImage,
      'title': 'Discover Everything You Need',
      'description': 'Browse thousands of products curated just for you.',
    },
    {
      'image': AppImages.secondStepperImage,
      'title': 'Track Your Orders Easily',
      'description': 'Get real-time updates from cart to doorstep.',
    },
    {
      'image': AppImages.thirdStepperImage,
      'title': 'Fast & Secure Checkout',
      'description': 'Shop with confidence, every single time.',
    },
  ];

  @override
  void initState() {
    super.initState();
    SharedPreferenceService.instance.isIntroShow = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            ?_currentIndex != introData.length - 1
                ? Align(
                    alignment: .centerEnd,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoutes.loginRoute,
                          (route) => false,
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: AppColor.textLabelColor,
                        padding: const EdgeInsets.only(right: 50),
                      ),
                      child: Text(
                        AppString.skip,
                        style: AppTextStyle.style(
                          fontSize: 16,
                          fontWeight: .semiBold,
                          height: 1.375,
                        ),
                      ),
                    ),
                  )
                : null,
            Expanded(
              child: PageView.builder(
                controller: _introPageController,
                itemCount: introData.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: .center,
                    children: [
                      Image.asset(introData[index]['image']!),
                      SizedBox(height: 32),
                      Text(
                        introData[index]['title'] ?? "",
                        style: AppTextStyle.style(
                          fontWeight: .bold,
                          fontSize: 24,
                          height: 1.25,
                          letterSpacing: -0.24,
                        ),
                        textAlign: .center,
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 55),
                        child: Text(
                          introData[index]['description'] ?? "",
                          textAlign: .center,
                          style: AppTextStyle.style(
                            fontWeight: .regular,
                            fontSize: 14,
                            height: 1.435,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                onPageChanged: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
              ),
            ),
            Row(
              mainAxisSize: .min,
              mainAxisAlignment: .center,
              spacing: 8,
              children: introData.asMap().entries.map((entry) {
                return Container(
                  height: 8,
                  width: entry.key == _currentIndex ? 15 : 8,
                  decoration: BoxDecoration(
                    color: entry.key == _currentIndex
                        ? AppColor.primaryColor
                        : AppColor.backgroundGray,
                    borderRadius: BorderRadius.circular(50),
                  ),
                );
              }).toList(),
            ),
            GestureDetector(
              onTap: () {
                _currentIndex == introData.length - 1
                    ? Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.loginRoute,
                        (route) => false,
                      )
                    : _introPageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
              },
              child: Container(
                margin: const EdgeInsets.all(24),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 13),
                child: Text(
                  _currentIndex == introData.length - 1
                      ? AppString.getStarted
                      : AppString.next,
                  style: AppTextStyle.style(
                    color: Colors.white,
                    fontWeight: .semiBold,
                    fontSize: 16,
                    height: 1.375,
                  ),
                  textAlign: .center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
