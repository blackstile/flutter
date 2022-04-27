import 'package:all_app_tutorial/food_app_ui/demo_data.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> images;
  const ImageCarousel({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.81,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            itemCount: widget.images.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Image.asset(widget.images[index], fit: BoxFit.cover),
            ),
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
          ),
          Positioned(
              bottom: defaultPadding,
              right: defaultPadding,
              child: Row(
                children: List.generate(
                  demoBigImages.length,
                  (index) => Padding(
                      padding: const EdgeInsets.only(left: defaultPadding / 4),
                      child: IndicatorDot(isActive: index == _currentPage)),
                ),
              ))
        ],
      ),
    );
  }
}

class IndicatorDot extends StatelessWidget {
  final bool isActive;

  const IndicatorDot({Key? key, this.isActive = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white60,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}
