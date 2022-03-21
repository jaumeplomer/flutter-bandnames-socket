import 'package:flutter/material.dart';

import 'package:test1/pages/home.dart';

void main() { runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MaterialApp',
      initialRoute: 'home',
      routes: {
        'home': ( _ ) => HomePage()
      },
    );
  }
}

