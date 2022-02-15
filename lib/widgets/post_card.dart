import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_ui/config/constants.dart';
import 'package:responsive_ui/config/palette.dart';
import 'package:responsive_ui/models/models.dart';
import 'package:responsive_ui/utils/widget_functions.dart';
import 'package:responsive_ui/widgets/create_post_container.dart';
import 'package:responsive_ui/widgets/rooms_widget.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Palette.darkSecondaryBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProfileAvatar(imageUrl: post.user.imageUrl),
                addHorizontalSpace(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.user.name,
                        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      Row(
                        children: [
                          Text(
                            "${post.timeAgo}  •  ",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          Icon(Icons.public, color: Colors.grey[200], size: 16),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz),
                  color: Colors.white,
                )
              ],
            ),
          ),
          addVerticalSpace(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: Text(
              post.caption,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          addVerticalSpace(10),
          post.imageUrl.isEmpty
              ? addVerticalSpace(0)
              : CachedNetworkImage(
                  imageUrl: post.imageUrl,
                ),
          addVerticalSpace(4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.thumb_up_rounded,
                      color: Palette.facebookBlue,
                      size: 14,
                    ),
                    addHorizontalSpace(5),
                    Text("${post.likes} likes", style: TextStyle(color: Colors.white),),
                  ],
                ),
                Row(
                  children: [
                    Text("${post.comments} comments • ", style: TextStyle(color: Colors.white,),),
                    Text("${post.shares} shares", style: TextStyle(color: Colors.white),),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CreatePostOptionButton(
                iconData: Icons.thumb_up,
                text: "Like",
                colorAccent: Colors.grey,
              ),
              CreatePostOptionButton(
                iconData: MdiIcons.commentOutline,
                text: "Comment",
                colorAccent: Colors.grey,
              ),
              CreatePostOptionButton(
                iconData: MdiIcons.shareOutline,
                text: "Share",
                colorAccent: Colors.grey,
              ),
            ],
          )
        ],
      ),
    );
  }
}
