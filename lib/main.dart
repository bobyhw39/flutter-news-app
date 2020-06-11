import 'package:flutter/material.dart';
import 'package:news_app/screens/details/details_news_screen.dart';
import 'package:news_app/screens/home/home_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{ DetailsNewsScreen.routeName: (context) => DetailsNewsScreen()},
      theme: ThemeData(
        brightness:Brightness.light,
        primarySwatch:Colors.red,
        accentColor: Colors.redAccent,
      ),
      debugShowCheckedModeBanner: false,
      home:HomeScreen(),
    );
  }
}
