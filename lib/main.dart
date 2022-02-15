import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_ui/config/constants.dart';
import 'package:responsive_ui/config/palette.dart';
import 'package:responsive_ui/screens/home_page.dart';
import 'package:responsive_ui/screens/nav_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ResponsiveX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Palette.darkBackground,
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      home: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Palette.darkSecondaryBackground,
          statusBarIconBrightness: Brightness.light,
        ),
        child: NavScreen(),
      ),
    );
  }
}
