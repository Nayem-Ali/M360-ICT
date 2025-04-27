import 'package:flutter/material.dart';

class OverlappingImages extends StatelessWidget {
  const OverlappingImages({
    super.key,
    required this.images,
    this.imageRadius = 12.0,
    this.overlapOffset = 10.0,
    this.borderWidth = 0.0,
  });

  final List<String> images;

  final double imageRadius;

  final double overlapOffset;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final double totalWidth = (images.length - 1) * overlapOffset + imageRadius * 2;

    return SizedBox(
      height: imageRadius * 2,
      width: totalWidth,
      child: Stack(
        children: List.generate(
          images.length,
          (index) => Positioned(
            left: index * overlapOffset,
            child: Container(
              height: imageRadius * 2,
              width: imageRadius * 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(imageRadius),
                border: Border.all(width: borderWidth, color: Colors.white),
              ),
              child: Image(image: AssetImage(images[index])),
            ),
          ),
        ),
      ),
    );
  }
}
