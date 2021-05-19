import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/data/zdata.dart';
import 'package:flutter_facebook_responsive_ui/screens/zscreens.dart';
import 'package:flutter_facebook_responsive_ui/widgets/zwidgets.dart';

class NavGroupScreen extends StatefulWidget {
  @override
  _NavGroupScreenState createState() => _NavGroupScreenState();
}

class _NavGroupScreenState extends State<NavGroupScreen> {
  final List<Widget> _screen = [
    HomeScreenGU(),
    HomeScreenGI(),
    HomeScreenGL(),
    HomeScreenGP(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.wb_incandescent,
    Icons.home_repair_service_outlined,
    Icons.rule_sharp,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
                preferredSize: Size(screenSize.width, 100.0),
                child: CustomAppBar(
                  currentUser: currentUser,
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                ),
              )
            : null,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screen,
        ),
        bottomNavigationBar: !Responsive.isDesktop(context)
            ? Container(
                padding: const EdgeInsets.only(bottom: 12.0),
                color: Colors.white,
                child: CustomTabBar(
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
