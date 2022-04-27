import 'package:facebook_interface/components/circle_button.dart';
import 'package:facebook_interface/components/stories_area.dart';
import 'package:facebook_interface/components/user_post_area.dart';
import 'package:facebook_interface/data/data.dart';
import 'package:facebook_interface/utils/color_palettes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            centerTitle: false,
            // expandedHeight: 250,
            floating: true,
            title: const Text(
              "facebook",
              style: TextStyle(
                color: ColorPalettes.facebookBlue,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            actions: [
              CircleButton(
                onPressed: () {},
                iconSize: 30,
                icon: const Icon(LineIcons.search),
              ),
              CircleButton(
                onPressed: () {},
                iconSize: 30,
                icon: const Icon(LineIcons.facebookMessenger),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: UserPostArea(currentUser: loggedUser,),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical:  10, horizontal : 0),
            sliver: SliverToBoxAdapter(
              child: StoriesArea(
                currentUser: loggedUser,
                stories: stories,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 500,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
