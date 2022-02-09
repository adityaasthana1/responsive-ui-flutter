import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_ui/config/palette.dart';
import 'package:responsive_ui/config/text_styles.dart';
import 'package:responsive_ui/data/data.dart';
import 'package:responsive_ui/widgets/create_post_container.dart';
import 'package:responsive_ui/widgets/icon_button_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
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
          ],
        ),
      ),
    );
  }
}
