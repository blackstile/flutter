import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/components/story_card.dart';
import 'package:facebook_interface/model/models.dart';
import 'package:flutter/material.dart';

class StoriesArea extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  StoriesArea(
      {Key? key, required this.currentUser, required this.stories}): super(key: key){
      stories.insert(0, Story(
        user: currentUser,
        imageUrl: currentUser.urlPhoto
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (context, index) {
          Story story = stories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: StoryCard(story: story),
          );
        },
      ),
    );
  }
}
