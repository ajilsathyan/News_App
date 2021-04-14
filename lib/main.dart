import 'package:flutter/material.dart';
import 'package:news_app/screens/home_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'News App',
      
      home: MyHomePage(),
    );
  }
}
