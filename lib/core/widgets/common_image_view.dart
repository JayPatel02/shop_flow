import 'dart:io';

import 'package:flutter/material.dart';

class CommonImageView extends StatelessWidget {
  final num? containerHeight;
  final num? containerWidth;
  final String networkImageSource;
  final bool? isLocalImage;

  const CommonImageView({
    super.key,
    required this.containerHeight,
    required this.networkImageSource,
    this.containerWidth,
    this.isLocalImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: .circular(8),
      child: Container(
        color: Colors.black,
        height: containerHeight?.toDouble(),
        width: containerWidth?.toDouble(),
        constraints: BoxConstraints(maxHeight: 143, maxWidth: 160),
        child: isLocalImage == true
            ? Image.file(File(networkImageSource), fit: .cover)
            : Image.network(networkImageSource, fit: .cover),
      ),
    );
  }
}
