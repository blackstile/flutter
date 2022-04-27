import 'dart:ui';

import 'package:all_app_tutorial/food_app_ui/components/image_carousel.dart';
import 'package:all_app_tutorial/food_app_ui/components/restaurant_info_medium_card.dart';
import 'package:all_app_tutorial/food_app_ui/components/section_title.dart';
import 'package:all_app_tutorial/food_app_ui/constants.dart';
import 'package:all_app_tutorial/food_app_ui/demo_data.dart';
import 'package:all_app_tutorial/food_app_ui/models/restaurant_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          floating: true,
          elevation: 0,
          centerTitle: true,
          title: Column(
            children: [
              Text(
                "Delivery to".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: kActiveColor),
              ),
              const Text(
                "San Francisco",
                style: TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                "Filter",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          sliver: SliverToBoxAdapter(
            child: ImageCarousel(images: demoBigImages),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(defaultPadding),
          sliver: SliverToBoxAdapter(
              child: SectionTitle(title: "Featured Patners", press: () {})),
        ),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                demoMediumCardData.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding / 2),
                  child: RestaurantInfoMediumCard(
                    restaurantInfo: RestaurantInfo.fromJSON(
                        demoMediumCardData[index], () {}),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(defaultPadding),
          sliver: SliverToBoxAdapter(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.asset(
                      "assets/food_ui_app/images/delivery-in-one-hours.png"),
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.transparent,
                          Colors.transparent
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Free Delivery",
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(defaultPadding),
          sliver: SliverToBoxAdapter(
              child: SectionTitle(title: "Others Restaurants", press: () {})),
        ),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                demoMediumCardData.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding / 2),
                  child: RestaurantInfoMediumCard(
                    restaurantInfo: RestaurantInfo.fromJSON(
                        demoMediumCardData[
                            demoMediumCardData.length - index - 1],
                        () {}),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
