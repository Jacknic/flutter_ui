import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui/components/ItemAction.dart';

class Mine extends StatelessWidget {
  final random = Random();
  final actionMap = {
    "支付": Icons.payment,
    "收藏": Icons.folder_special,
    "相册": Icons.photo_library,
    "卡包": Icons.account_balance_wallet,
    "表情": Icons.insert_emoticon,
    "设置": Icons.settings,
  };
  final panelHeight = 110.0;

  @override
  Widget build(BuildContext context) {
    final actionList = actionMap.keys.toList();
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          height: panelHeight,
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "https://avatars0.githubusercontent.com/u/12482089",
                  width: 80,
                  height: 80,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Jacknic",
                      style: TextStyle(color: Colors.black, fontSize: 28),
                    ),
                    Text("微信号：Jacknic"),
                  ],
                ),
              )
            ],
          ),
        ),
        Align(
          child: Container(
            margin: EdgeInsets.only(top: 40, right: 10),
            child: Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ),
          alignment: Alignment.topRight,
        ),
        Align(
          child: Container(
            margin: EdgeInsets.only(top: 44, right: 40),
            child: Icon(
              Icons.apps,
              color: Colors.grey,
              size: 16,
            ),
          ),
          alignment: Alignment.topRight,
        ),
        Container(
          margin: EdgeInsets.only(top: panelHeight + 8),
          child: ListView.builder(
            itemCount: actionList.length,
            itemBuilder: (context, index) {
              var actionName = actionList[index];
              var isLargeMargin = index == 1 || index == actionList.length - 1;
              return ItemAction(
                actionName: actionName,
                icon: actionMap[actionName],
                iconColor:
                    Colors.primaries[random.nextInt(Colors.primaries.length)],
                isLargeMargin: isLargeMargin,
              );
            },
          ),
        )
      ],
    );
  }
}
