import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_ui/data/data.dart';
import 'package:responsive_ui/screens/home_page.dart';
import 'package:responsive_ui/widgets/custom_app_bar.dart';
import 'package:responsive_ui/widgets/custom_tab_bar.dart';
import 'package:responsive_ui/widgets/responsive.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomePage(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];

  int selected_index = 0;

  @override
  Widget build(BuildContext context) {
    final Size ScreenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
                child: CustomAppBar(
                  currentUser: currentUser,
                  icons: _icons,
                  selectedIndex: selected_index,
                  onTap: (index) => setState(() => selected_index = index),
                ),
                preferredSize: Size(ScreenSize.width, 100))
            : null,
        body: IndexedStack(
          index: selected_index,
          children: _screens,
        ),
        bottomNavigationBar: !Responsive.isDesktop(context)
            ? CustomTabBar(
                icons: _icons,
                selectedIndex: selected_index,
                onTap: (int a) {
                  setState(() {
                    selected_index = a;
                  });
                },
                isBottomIndicator: false,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
