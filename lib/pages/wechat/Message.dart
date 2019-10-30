import 'dart:math';

import 'package:flutter/material.dart';

class MessageList extends StatelessWidget {
  final random = Random();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 30,
      itemBuilder: (context, index) {
        return FlatButton(
          color: Colors.white,
          child: ListTile(
            contentPadding: EdgeInsets.only(top: 4, bottom: 4),
            leading: Icon(
              Icons.image,
              size: 46,
              color: Colors.primaries[random.nextInt(Colors.primaries.length)],
            ),
            title: Text("工作讨论中心 $index"),
            subtitle: Text("消息内容 $index"),
            trailing: Column(
              children: <Widget>[
                Text("16:38",
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                Icon(
                  Icons.notifications,
                  size: index * index % 6 == 1 ? 12 : 0,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          onPressed: () {
            print('点击 $index');
          },
        );
      },
    );
  }
}
