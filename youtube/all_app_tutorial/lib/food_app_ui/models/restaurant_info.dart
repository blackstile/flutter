import 'package:flutter/foundation.dart';

class RestaurantInfo {
  final String title, image, location;
  final double rating;
  final int deliverTime;
  final VoidCallback press;

  RestaurantInfo(this.title, this.image, this.rating, this.deliverTime,
      this.press, this.location);

  RestaurantInfo.fromJSON(Map<String, dynamic> json, VoidCallback press)
      : this.title = json["name"],
        this.image = json["image"],
        this.location = json["location"],
        this.rating = json["rating"],
        this.deliverTime = json["deliverTime"],
        this.press = press;
}
