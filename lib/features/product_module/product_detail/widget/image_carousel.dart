import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/widgets/common_heart_button.dart';
import 'package:shop_flow/features/product_module/product_detail/widget/display_back_button.dart';

class ImageCarousel extends StatefulWidget {
  final List<String>? imageList;
  final VoidCallback onClick;
  final bool isFavourite;

  const ImageCarousel({
    super.key,
    required this.imageList,
    required this.onClick,
    required this.isFavourite,
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentIndex = 0;
  late double statusBarHeight = MediaQuery.of(context).padding.top;
  final CarouselSliderController carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: carouselController,
          items: widget.imageList?.map((image) {
            return SizedBox(
              width: double.infinity,
              child: Image.network(image, fit: .cover),
            );
          }).toList(),
          options: CarouselOptions(
            aspectRatio: 390 / 400,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Padding(
            padding: EdgeInsets.only(top: statusBarHeight),
            child: SizedBox(
              height: 45,
              width: 45,
              child: CommonHeartButton(
                onClick: widget.onClick,
                value: widget.isFavourite,
                isSmall: false,
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Padding(
            padding: EdgeInsets.only(top: statusBarHeight),
            child: SizedBox(height: 45, width: 45, child: DisplayBackButton()),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 200,
          child: Row(
            spacing: 8,
            children: List.generate(widget.imageList?.length ?? 0, (index) {
              return Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  shape: .circle,
                  color: _currentIndex == index
                      ? AppColor.primaryColor
                      : AppColor.textLabelColor,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
