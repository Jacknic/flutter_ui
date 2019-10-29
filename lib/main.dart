import 'package:flutter/material.dart';
import 'package:flutter_ui/misc/router.dart';
import 'package:flutter_ui/pages/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: routes,
    );
  }
}
