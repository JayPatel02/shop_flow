import 'package:flutter/material.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_text_style.dart';

class CommonQuantityAddButton extends StatelessWidget {
  final VoidCallback addFunction;
  final VoidCallback deleteFunction;
  final String value;
  final bool? isSmall;

  const CommonQuantityAddButton({
    super.key,
    required this.addFunction,
    required this.deleteFunction,
    required this.value,
    this.isSmall,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.palePastelLavender,
        borderRadius: .circular(50),
        border: BoxBorder.all(color: AppColor.backgroundGray, width: 1),
      ),
      child: Row(
        mainAxisSize: .min,
        spacing: isSmall == true ? 3 : 15,
        children: [
          IconButton(
            onPressed: deleteFunction,
            visualDensity: isSmall == true ? VisualDensity() : null,
            icon: Icon(Icons.horizontal_rule, size: isSmall == true ? 15 : 22),
          ),
          Text(
            value,
            style: AppTextStyle.style(
              fontSize: isSmall == true ? 15 : 16,
              height: 1.375,
              fontWeight: .semiBold,
            ),
          ),
          IconButton(
            onPressed: addFunction,
            icon: Icon(Icons.add, size: isSmall == true ? 15 : 22),
          ),
        ],
      ),
    );
  }
}
