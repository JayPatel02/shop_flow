import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_images.dart';
import 'package:shop_flow/core/constants/app_string.dart';
import 'package:shop_flow/core/constants/app_text_style.dart';

class CommonHeader extends StatelessWidget implements PreferredSizeWidget {
  final bool? isBack;

  const CommonHeader({super.key, this.isBack = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.backgroundWhite,
      leading: isBack == true
          ? IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
            )
          : Icon(Icons.search),
      title: Text(
        AppString.brandName,
        style: AppTextStyle.style(
          fontWeight: .bold,
          fontSize: 24,
          height: 1.25,
          color: AppColor.primaryColor,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 28),
          child: SvgPicture.asset(AppImages.headerActionIcon),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
