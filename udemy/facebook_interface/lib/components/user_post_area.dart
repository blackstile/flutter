import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/components/action_post_button.dart';
import 'package:facebook_interface/model/models.dart';
import 'package:flutter/material.dart';

class UserPostArea extends StatelessWidget {
  final User currentUser;

  const UserPostArea({Key? key, required this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[200],
                  backgroundImage:
                      CachedNetworkImageProvider(currentUser.urlPhoto),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: "No que você está pensando hoje ?"),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 10,
              thickness: 0.5,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                ActionPostButton(icon: Icons.videocam, color: Colors.red, label: "Ao vivo",),
                VerticalDivider(width: 8,),
                ActionPostButton(icon: Icons.photo_library, color: Colors.green, label: "Photos",),
                VerticalDivider(width: 8,),
                ActionPostButton(icon: Icons.video_call, color: Colors.deepPurple, label: "Ao vivo",),
              ]),
            ),
          ],
        ));
  }
}
