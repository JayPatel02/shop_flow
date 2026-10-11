import 'package:flutter/material.dart';
import 'package:shop_flow/core/constants/app_color.dart';

class DisplayBackButton extends StatelessWidget {
  const DisplayBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pop();
      },
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: AppColor.backgroundWhiteOpacity,
          shape: .circle,
        ),
        child: Icon(Icons.arrow_back , color: AppColor.textPrimaryColor , size: 25,),
      ),
    );
  }
}
