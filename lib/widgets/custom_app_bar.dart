import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_ui/config/text_styles.dart';
import 'package:responsive_ui/models/models.dart';
import 'package:responsive_ui/utils/widget_functions.dart';
import 'package:responsive_ui/widgets/circle_button.dart';
import 'package:responsive_ui/widgets/custom_tab_bar.dart';
import 'package:responsive_ui/widgets/rooms_widget.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomAppBar(
      {Key? key,
      required this.currentUser,
      required this.icons,
      required this.selectedIndex,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "ResponsiveX",
              style: faceBookText,
            ),
          ),
          Container(
            width: 600,
            child: CustomTabBar(
              icons: icons,
              selectedIndex: selectedIndex,
              onTap: onTap,
              isBottomIndicator: true,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl),
                addHorizontalSpace(10),
                Text(
                  currentUser.name,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                addHorizontalSpace(10),
                CircleButton(
                  icon: Icons.search,
                  iconSize: 30,
                  onPressed: () {},
                ),
                CircleButton(
                  icon: MdiIcons.facebookMessenger,
                  iconSize: 30,
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
