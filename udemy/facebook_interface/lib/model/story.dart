import 'package:facebook_interface/model/user.dart';

class Story {
  final User user;
  final String imageUrl;
  final bool viewed;

  Story({required this.user, required this.imageUrl, this.viewed=false});

}
