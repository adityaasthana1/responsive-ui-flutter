import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_ui/config/constants.dart';
import 'package:responsive_ui/models/models.dart';
import 'package:responsive_ui/utils/widget_functions.dart';
import 'package:responsive_ui/widgets/rooms_widget.dart';

class PostCard extends StatelessWidget {

  final Post post;

  const PostCard({Key? key,required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProfileAvatar(imageUrl: post.user.imageUrl),
              addHorizontalSpace(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.user.name),
                    addVerticalSpace(2),
                    Row(
                      children: [
                        Text(
                          "${post.timeAgo}  •  ", 
                          style: TextStyle(
                            fontSize: 12,
                            color: COLOR_GREY
                          ),
                        ),
                        Icon(Icons.public, color: Colors.grey[200], size: 16),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz),color: Colors.grey[200],)
            ],
          ),

          CachedNetworkImage(imageUrl: post.imageUrl, fit : BoxFit.fitWidth, )
        ],
      ),
    );
  }
}