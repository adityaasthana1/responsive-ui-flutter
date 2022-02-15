import 'package:flutter/material.dart';
import 'package:responsive_ui/config/palette.dart';

class AppBarIconButton extends StatelessWidget {
  final IconData iconData;

  const AppBarIconButton({Key? key, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        color: Palette.darkBackground,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          iconData,
          color: Colors.white,
        ),
        iconSize: 24,
      ),
    );
  }
}
