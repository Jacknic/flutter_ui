import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/wechat/Discovery.dart';
import 'package:flutter_ui/pages/wechat/Message.dart';
import 'package:flutter_ui/pages/wechat/Mine.dart';

class WeChatPage extends StatefulWidget {
  static const PAGE_NAME = "微信主界面";

  @override
  WeChatPageState createState() {
    return WeChatPageState();
  }
}

class WeChatPageState extends State<WeChatPage> {
  var _currentIndex = 0;
  final actionMap = {
    "发起群聊": Icons.group,
    "添加朋友": Icons.person_add,
    "扫一扫": Icons.pages,
    "收付款": Icons.monetization_on,
    "帮助与反馈": Icons.help
  };
  final tabMap = {
    "微信": Icons.message,
    "联系人": Icons.contacts,
    "发现": Icons.navigation,
    "我": Icons.account_circle,
  };

  final pages = <Widget>[
    MessageList(),
    MessageList(),
    Discovery(),
    Mine(),
  ];
  var hideAppBar = false;

  @override
  Widget build(BuildContext context) {
    var pageController = PageController(initialPage: _currentIndex);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: hideAppBar ? Colors.white : Colors.grey[200],
        automaticallyImplyLeading: false,
        title: Text(
          hideAppBar ? "" : "微信",
          style:
              Theme.of(context).textTheme.title.copyWith(color: Colors.black),
        ),
        actionsIconTheme: IconThemeData(color: Colors.black),
        actions: hideAppBar
            ? [
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () {
                    print('点击拍摄');
                  },
                  tooltip: "拍摄",
                )
              ]
            : <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    print('点击搜索');
                  },
                  tooltip: "搜素",
                ),
                PopupMenuButton(
                  tooltip: "更多",
                  color: Colors.black,
                  icon: Icon(Icons.add_circle_outline),
                  offset: Offset(0, 56),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  itemBuilder: (context) {
                    return actionMap.keys.map((action) {
                      return PopupMenuItem(
                        value: action,
                        child: FlatButton.icon(
                          onPressed: null,
                          icon: Icon(
                            actionMap[action],
                            color: Colors.white,
                          ),
                          label: Text(
                            action,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }).toList();
                  },
                  onSelected: (action) {
                    print('点击$action');
                  },
                ),
              ],
      ),
      body: PageView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
        controller: pageController,
        onPageChanged: (i) {
          setState(() {
            hideAppBar = pages.length - 1 == i;
            _currentIndex = i;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          onTap: (i) {
            setState(() {
              _currentIndex = i;
              pageController.jumpToPage(i);
            });
          },
          currentIndex: _currentIndex,
          unselectedItemColor: Colors.grey,
          items: tabMap.keys.map(
            (tabName) {
              return BottomNavigationBarItem(
                icon: Icon(
                  tabMap[tabName],
                ),
                title: Text(tabName),
              );
            },
          ).toList()),
    );
  }
}
