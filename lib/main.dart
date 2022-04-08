import 'package:ask_while_you_can/screen/homepage.dart';

import 'package:flutter/material.dart';

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
        title: 'Ask While You Can',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Homepage());
  }
}
