import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_ui/config/palette.dart';
import 'package:responsive_ui/config/text_styles.dart';
import 'package:responsive_ui/data/data.dart';
import 'package:responsive_ui/widgets/create_post_container.dart';
import 'package:responsive_ui/widgets/icon_button_appbar.dart';
import 'package:responsive_ui/widgets/rooms_widget.dart';
import 'package:responsive_ui/widgets/stories_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              title: Text(
                "ResponsiveX",
                style: faceBookText,
              ),
              centerTitle: false,
              floating: true,
              actions: const [
                AppBarIconButton(iconData: Icons.search),
                AppBarIconButton(iconData: MdiIcons.facebookMessenger)
              ],
            ),
            SliverToBoxAdapter(
              child: CreatePostContainer(currentUser: currentUser),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              sliver: SliverToBoxAdapter(
                child: RoomsWidget(onlineUsers: onlineUsers),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              sliver: SliverToBoxAdapter(
                child: StoryBoard(
                  currentUser: currentUser,
                  stories: stories,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    color: Colors.orange,
                    height: 20,
                    margin: const EdgeInsets.all(10),
                  );
                },
                childCount: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
