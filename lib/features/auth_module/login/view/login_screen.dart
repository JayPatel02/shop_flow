import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_images.dart';
import 'package:shop_flow/core/constants/app_routes.dart';
import 'package:shop_flow/core/constants/app_string.dart';
import 'package:shop_flow/core/constants/app_text_style.dart';
import 'package:shop_flow/core/widgets/common_input_field.dart';
import 'package:shop_flow/core/widgets/padded_label.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _secureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundWhite,
      body: SafeArea(
        child: Card(
          margin: const EdgeInsetsGeometry.symmetric(
            horizontal: 11,
            vertical: 20,
          ),
          color: Colors.white,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SvgPicture.asset(AppImages.appLogo),
                    SizedBox(height: 20),
                    Text(
                      AppString.brandName,
                      style: AppTextStyle.style(
                        fontWeight: .bold,
                        color: AppColor.primaryColor,
                        fontSize: 24,
                        height: 1.25,
                        letterSpacing: -0.6,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      AppString.welcomeBack,
                      style: AppTextStyle.style(
                        fontWeight: .semiBold,
                        fontSize: 18,
                        height: 1.335,
                        letterSpacing: -0.6,
                      ),
                    ),
                    SizedBox(height: 32),
                    PaddedLabel(label: AppString.username),
                    SizedBox(height: 4),
                    CommonInputField(
                      prefixIcon: Icon(Icons.person_outline),
                      textController: emailController,
                      hintText: AppString.inputHintText("email"),
                    ),

                    SizedBox(height: 16),
                    PaddedLabel(label: AppString.password),
                    SizedBox(height: 4),
                    CommonInputField(
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          _secureText = !_secureText;
                        });
                      }, icon: Icon(_secureText ? Icons.visibility_outlined : Icons.visibility_off_outlined)),
                      textController: passwordController,
                      hintText: AppString.inputHintText("password"),
                      secureText: _secureText,
                    ),

                    SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColor.backgroundRedColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        spacing: 12,
                        children: [
                          Icon(Icons.info_outline, color: AppColor.textRedColor),
                          Text(
                            "Invalid Credentials",
                            style: AppTextStyle.style(
                              fontWeight: .medium,
                              height: 1.43,
                              color: AppColor.textRedColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRoutes.homeRoute, (route) => false);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColor.primaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: .center,
                          mainAxisSize: .min,
                          spacing: 8,
                          children: [
                            Text(
                              "Log in",
                              style: AppTextStyle.style(
                                color: Colors.white,
                                fontWeight: .semiBold,
                                fontSize: 16,
                                height: 1.375,
                              ),
                              textAlign: .center,
                            ),
                            Icon(Icons.arrow_forward, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      AppString.demoString,
                      style: AppTextStyle.style(
                        fontWeight: .medium,
                        color: AppColor.primaryColor,
                        fontSize: 12,
                        height: 1.325,
                        letterSpacing: 0.12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}