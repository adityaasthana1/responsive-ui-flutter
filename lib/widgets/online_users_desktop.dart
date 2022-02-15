import 'package:flutter/material.dart';
import 'package:responsive_ui/utils/widget_functions.dart';
import 'package:responsive_ui/widgets/rooms_widget.dart';

class OnlineUserDesktopHome extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final Function() onTap;

  const OnlineUserDesktopHome(
      {Key? key,
      required this.imageUrl,
      required this.userName,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 0),
        child: Row(
          children: [
            ProfileAvatar(
              imageUrl: imageUrl,
              isActive: true,
            ),
            addHorizontalSpace(10),
            Text(userName,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white
            ),)
          ],
        ),
      ),
    );
  }
}
