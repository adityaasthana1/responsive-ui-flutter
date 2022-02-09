import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_ui/config/palette.dart';
import 'package:responsive_ui/models/models.dart';
import 'package:responsive_ui/utils/widget_functions.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({Key? key, required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[200],
                backgroundImage:
                    CachedNetworkImageProvider(currentUser.imageUrl),
              ),
              addHorizontalSpace(12),
              const Expanded(
                child: TextField(
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration.collapsed(
                    hintText: "What\'s on your mind?",
                  ),
                ),
              )
            ],
          ),
          addVerticalSpace(12),
          const Divider(height: 12, thickness: 0.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CreatePostOptionButton(
                iconData: Icons.videocam,
                text: "Go Live",
                colorAccent: Colors.red,
              ),
              VerticalDivider(width: 8),
              CreatePostOptionButton(
                iconData: Icons.photo,
                text: "Photos",
                colorAccent: Colors.green,
              ),
              VerticalDivider(width: 8),
              CreatePostOptionButton(
                iconData: Icons.video_call,
                text: "Room",
                colorAccent: Colors.purple,
              ),
              VerticalDivider(width: 8),
            ],
          )
        ],
      ),
    );
  }
}

class CreatePostOptionButton extends StatelessWidget {
  final IconData iconData;
  final String text;
  final MaterialColor colorAccent;

  const CreatePostOptionButton(
      {Key? key,
      required this.iconData,
      required this.text,
      required this.colorAccent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Icon(
            iconData,
            color: colorAccent,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          )
        ],
      ),
    );
  }
}
