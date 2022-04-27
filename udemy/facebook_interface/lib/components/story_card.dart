import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/model/story.dart';
import 'package:facebook_interface/utils/color_palettes.dart';
import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  final Story story;
  const StoryCard({Key? key, required this.story}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
              imageUrl: story.imageUrl,
              height: double.infinity,
              width: 110,
              fit: BoxFit.cover),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: ColorPalettes.storyGradient,
          ),
        )
      ],
    );
  }
}