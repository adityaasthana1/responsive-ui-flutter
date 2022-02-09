import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  final IconData iconData;

  const AppBarIconButton({Key? key, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          iconData,
          color: Colors.black,
        ),
        iconSize: 24,
      ),
    );
  }
}
