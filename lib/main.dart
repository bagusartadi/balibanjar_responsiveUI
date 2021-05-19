import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/artadot.dart';
import 'package:flutter_facebook_responsive_ui/screens/zscreens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'balibanjar UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: WarnaArtadi.warnatiga,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: WarnaArtadi.warnadasar)),
        textTheme:
            TextTheme(bodyText1: TextStyle(color: WarnaArtadi.warnadasar)),
        dialogBackgroundColor: WarnaArtadi.warnadasar,
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: WarnaArtadi.warnadasar,
      ),
      home: NavHomeScreen(),
    );
  }
}
