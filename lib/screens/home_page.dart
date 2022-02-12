import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_ui/config/palette.dart';
import 'package:responsive_ui/config/text_styles.dart';
import 'package:responsive_ui/data/data.dart';
import 'package:responsive_ui/utils/widget_functions.dart';
import 'package:responsive_ui/widgets/create_post_container.dart';
import 'package:responsive_ui/widgets/icon_button_appbar.dart';
import 'package:responsive_ui/widgets/online_users_desktop.dart';
import 'package:responsive_ui/widgets/post_card.dart';
import 'package:responsive_ui/widgets/responsive.dart';
import 'package:responsive_ui/widgets/rooms_widget.dart';
import 'package:responsive_ui/widgets/side_option.dart';
import 'package:responsive_ui/widgets/stories_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Responsive(
            mobile: _HomePageMobile(),
            tablet: _HomePageMobile(),
            desktop: _HomePageDesktop(),
          ),
        ),
      ),
    );
  }
}

class _HomePageMobile extends StatelessWidget {
  const _HomePageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        if (!Responsive.isDesktop(context))
          SliverAppBar(
            elevation: 10,
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
              return PostCard(post: posts[index]);
            },
            childCount: posts.length,
          ),
        )
      ],
    );
  }
}

class _HomePageDesktop extends StatelessWidget {
  const _HomePageDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Center(
                child: Column(
              children: [
                SideOptionDesktopHome(
                  iconData: Icons.pages,
                  text: "Pages",
                  ontap: () {},
                ),
                addVerticalSpace(20),
                SideOptionDesktopHome(
                  iconData: Icons.people,
                  text: "Friends",
                  ontap: () {},
                ),
                addVerticalSpace(20),
                SideOptionDesktopHome(
                  iconData: Icons.groups,
                  text: "Groups",
                  ontap: () {},
                ),
                addVerticalSpace(20),
                SideOptionDesktopHome(
                  iconData: Icons.games,
                  text: "Games",
                  ontap: () {},
                ),
                addVerticalSpace(20),
              ],
            )),
          ),
        ),
        Spacer(),
        Container(
          width: 600,
          child: CustomScrollView(
            scrollBehavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                sliver: SliverToBoxAdapter(
                  child: StoryBoard(
                    currentUser: currentUser,
                    stories: stories,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Material(
                  child: CreatePostContainer(currentUser: currentUser),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                sliver: SliverToBoxAdapter(
                  child: RoomsWidget(onlineUsers: onlineUsers),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return PostCard(post: posts[index]);
                  },
                  childCount: posts.length,
                ),
              )
            ],
          ),
        ),
        Spacer(),
        Expanded(
          flex:2,
          child: Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Online",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                addVerticalSpace(10),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return OnlineUserDesktopHome(
                          imageUrl: onlineUsers[index].imageUrl,
                          userName: onlineUsers[index].name,
                          onTap: () {});
                    },
                    itemCount: onlineUsers.length,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
