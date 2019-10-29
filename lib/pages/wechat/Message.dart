import 'dart:math';

import 'package:flutter/material.dart';

class MessageList extends StatelessWidget {
  final random = Random();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 30,
      itemBuilder: (context, index) {
        return RaisedButton(
          color: Colors.white,
          padding: EdgeInsets.all(0),
          child: Container(
            padding: EdgeInsets.all(8),
            height: 60,
            child: Stack(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.image,
                      size: 46,
                      color: Colors
                          .primaries[random.nextInt(Colors.primaries.length)],
                    ),
                    Column(
                      children: <Widget>[
                        Text("工作讨论中心"),
                        Text(
                          "工作讨论中心",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text("16:38",
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Icon(
                        Icons.notifications,
                        size: index * index % 6 == 1 ? 12 : 0,
                        color: Colors.grey,
                      ),
                    )),
              ],
            ),
          ),
          onPressed: () {},
        );
      },
    );
  }
}
