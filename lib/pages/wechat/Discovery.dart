import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui/components/ItemAction.dart';

class Discovery extends StatelessWidget {
  final random = Random();
  final discoveryMap = {
    "朋友圈": Icons.camera,
    "看一看": Icons.remove_red_eye,
    "搜一搜": Icons.filter_drama,
    "小程序": Icons.widgets,
  };

  @override
  Widget build(BuildContext context) {
    final discoveryList = discoveryMap.keys.toList();
    return ListView.builder(
      itemCount: discoveryList.length,
      addRepaintBoundaries: false,
      itemBuilder: (context, index) {
        var name = discoveryList[index];
        var isLargeMargin = index == 1 || index == discoveryList.length - 1;
        return ItemAction(
          icon: discoveryMap[name],
          actionName: name,
          iconColor: Colors.primaries[random.nextInt(Colors.primaries.length)],
          isLargeMargin: isLargeMargin,
        );
      },
    );
  }
}
