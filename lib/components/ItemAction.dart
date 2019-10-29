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
      height: 54,
      child: RaisedButton(
        color: Colors.white,
        elevation: 0,
        highlightElevation: 0,
        padding: EdgeInsets.only(left: 10),
        onPressed: () {
          print('点击 $actionName');
        },
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(icon, color: iconColor, size: 24),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(actionName),
                ),
              ],
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
