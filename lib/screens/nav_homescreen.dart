import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/data/main_data/data.dart';
import 'package:flutter_facebook_responsive_ui/screens/zscreens.dart';
import 'package:flutter_facebook_responsive_ui/widgets/zwidgets.dart';

class NavHomeScreen extends StatefulWidget {
  @override
  _NavHomeScreenState createState() => _NavHomeScreenState();
}

class _NavHomeScreenState extends State<NavHomeScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    GroupScreen(),
    FavoriteScreen(),
    ChartScreen(),
    // NotificationScreen(),
  ];
  final List<IconData> _icons = const [
    Icons.home,
    Icons.group_add,
    Icons.search_sharp,
    Icons.family_restroom,
    // Icons.notifications_active_rounded,
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
          children: _screens,
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
