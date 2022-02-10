import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_ui/config/palette.dart';
import 'package:responsive_ui/models/models.dart';

class RoomsWidget extends StatelessWidget {
  final List<User> onlineUsers;

  const RoomsWidget({Key? key, required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Container(
        //   padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
        //   decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(30),
        //       border: Border.all(color: Palette.facebookBlue, width: 1)),
        //   child: Row(
        //     children: [
        //       Icon(Icons.video_call_outlined),
        //       Text("Create Room"),
        //     ],
        //   ),
        // ),
        Expanded(
          child: Container(
            height: 50,
            color: Colors.white,
            child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: _CreateRoomButton(),
                  );
                }
                final User user = onlineUsers[index - 1];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ProfileAvatar(
                    imageUrl: user.imageUrl,
                    isActive: true,
                  ),
                );
              },
              itemCount: onlineUsers.length,
            ),
          ),
        )
      ],
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;

  const ProfileAvatar(
      {Key? key,
      required this.imageUrl,
      this.isActive = false,
      this.hasBorder = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
            radius: hasBorder ? 17.0 : 20.0,
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
        ),
        isActive
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  height: 15.0,
                  width: 15.0,
                  decoration: BoxDecoration(
                    color: Palette.online,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () => print('Create Room'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      borderSide: const BorderSide(
        width: 3.0,
        color: Palette.facebookBlue,
      ),
      textColor: Palette.facebookBlue,
      child: Row(
        children: const [
          // ShaderMask(
          //   shaderCallback: (rect) =>
          //       Palette.createRoomGradient.createShader(rect),
          //   child: Icon(
          //     Icons.video_call,
          //     size: 35.0,
          //     color: Colors.white,
          //   ),
          // ),
          Icon(
            Icons.video_call,
            size: 25.0,
            color: Colors.purple,
          ),
          SizedBox(width: 4.0),
          Text(
            'Create\nRoom',
            style: TextStyle(fontSize: 10, wordSpacing: -1),
          ),
        ],
      ),
    );
  }
}
