import 'package:flutter/material.dart';

/// 操作条目
class ItemAction extends StatelessWidget {
  final bool isLargeMargin;

  final String actionName;

  final Color iconColor;

  final IconData icon;

  ItemAction({
    this.icon,
    this.actionName,
    this.isLargeMargin = false,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: isLargeMargin ? 8 : 0.5),
      color: Colors.white,
      child: FlatButton(
        onPressed: () {
          print('点击 $actionName');
        },
        child: ListTile(
          contentPadding: EdgeInsets.only(top: 5, bottom: 5),
          leading: Icon(icon, color: iconColor, size: 24),
          title: Text(actionName),
          trailing: Icon(Icons.chevron_right, color: Colors.grey),
        ),
      ),
    );
  }
}
