import 'package:flutter/material.dart';
import 'package:responsive_ui/config/palette.dart';
import 'package:responsive_ui/utils/widget_functions.dart';
import 'package:responsive_ui/widgets/rooms_widget.dart';

class SideOptionDesktopHome extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Function() ontap;

  const SideOptionDesktopHome(
      {Key? key,
      required this.iconData,
      required this.text,
      required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        splashColor: Palette.darkSecondaryBackground,
        onTap: () => ontap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    iconData,
                    size: 24,
                    color: Palette.darkAccentColor,
                  ),
                  addHorizontalSpace(10),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
