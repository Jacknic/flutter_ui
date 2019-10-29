import 'package:flutter/material.dart';
import 'package:flutter_ui/misc/router.dart';

class HomePage extends StatefulWidget {
  static const PAGE_NAME = "UI页面列表";

  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  var routeNames = routes.keys.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(HomePage.PAGE_NAME),
      ),
      body: ListView.builder(
        itemCount: routes.length,
        itemBuilder: (context, i) {
          var routeName = routeNames[i];
          return MaterialButton(
            color: Colors.white,
            child: Container(
              alignment: Alignment.centerLeft,
              height: 50,
              child: Text(routeName),
            ),
            onPressed: () => {
              Navigator.pushNamed(context, routeName),
            },
          );
        },
      ),
    );
  }
}
