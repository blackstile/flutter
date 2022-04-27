import 'package:all_app_tutorial/food_app_ui/models/restaurant_info.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../demo_data.dart';

class RestaurantInfoMediumCard extends StatelessWidget {
  final RestaurantInfo restaurantInfo;
  const RestaurantInfoMediumCard({Key? key, required this.restaurantInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: restaurantInfo.press,
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.25,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Image.asset(
                  restaurantInfo.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: defaultPadding / 2,
            ),
            Text(
              restaurantInfo.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              restaurantInfo.location,
              style: const TextStyle(color: kBodyTextColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
              child: DefaultTextStyle(
                style: const TextStyle(color: Colors.black, fontSize: 12),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding / 2,
                          vertical: defaultPadding / 8),
                      decoration: const BoxDecoration(
                          color: kActiveColor,
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: Text(
                        restaurantInfo.rating.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    const Spacer(),
                    Text('${restaurantInfo.deliverTime.toString()} min'),
                    const Spacer(),
                    const CircleAvatar(
                      backgroundColor: Color(0xFF868686),
                      radius: 2,
                    ),
                    const Spacer(),
                    const Text("Free delivery"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
