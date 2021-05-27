import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/artadot.dart';
import 'package:flutter_facebook_responsive_ui/screens/login_screen.dart';

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
        accentColor: WarnaArtadi.warnalima,
        appBarTheme: AppBarTheme(
            backgroundColor: WarnaArtadi.warnadasar,
            titleSpacing: 1.5,
            titleTextStyle: TextStyle(color: Colors.blue, fontSize: 30),
            iconTheme: IconThemeData(color: Colors.white)),
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
        dialogBackgroundColor: WarnaArtadi.warnalima,
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: WarnaArtadi.warnadasar,
      ),
      home: LoginScreen(),
    );
  }
}
