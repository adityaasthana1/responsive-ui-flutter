import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_ui/config/palette.dart';
import 'package:responsive_ui/models/models.dart';
import 'package:responsive_ui/widgets/responsive.dart';
import 'package:responsive_ui/widgets/rooms_widget.dart';

class StoryBoard extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const StoryBoard({Key? key, required this.currentUser, required this.stories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      color: Responsive.isDesktop(context) ? Colors.transparent : Colors.white,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return StoryCard(
                isAddStory: true,
                currentUser: currentUser,
                story: stories[index]);
          }
          return StoryCard(currentUser: currentUser, story: stories[index - 1]);
        },
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User currentUser;
  final Story story;

  const StoryCard({
    Key? key,
    this.isAddStory = false,
    required this.currentUser,
    required this.story,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
              fit: BoxFit.fitHeight,
            ),
            Positioned(
              bottom: 8.0,
              left: 8.0,
              right: 8.0,
              child: Text(
                isAddStory ? 'Add to Story' : story.user.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Positioned(
              top: 8.0,
              left: 8.0,
              child: isAddStory
                  ? Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.add),
                        iconSize: 30.0,
                        color: Palette.facebookBlue,
                        onPressed: () => print('Add to Story'),
                      ),
                    )
                  : ProfileAvatar(
                      imageUrl: story.user.imageUrl,
                      hasBorder: !story.isViewed,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
