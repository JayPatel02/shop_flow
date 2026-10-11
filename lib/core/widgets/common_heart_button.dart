import 'package:flutter/material.dart';
import 'package:shop_flow/core/constants/app_color.dart';

class CommonHeartButton extends StatelessWidget {
  final Color? iconColor;
  final VoidCallback onClick;
  final bool value;
  final bool? isSmall;

  const CommonHeartButton({
    super.key,
    this.iconColor,
    required this.onClick,
    required this.value,
    this.isSmall = true
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: AppColor.backgroundWhiteOpacity,
          shape: .circle,
        ),
        child: Icon(
          value ? Icons.favorite : Icons.favorite_border,
          size: isSmall == true ? 18 : 25,
          color: value ? AppColor.primaryRedColor : AppColor.textPrimaryColor,
        ),
      ),
    );
  }
}
