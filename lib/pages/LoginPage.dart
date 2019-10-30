import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// 登录页面
/// 来源 https://www.uplabs.com/posts/free-onboarding-screens
class LoginPage extends StatefulWidget {
  static const PAGE_NAME = "登录页面 1";

  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  var selectedIndex = 0;
  final mainColor = Color.fromARGB(255, 79, 68, 255);
  var pageCount = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.only(bottom: 240),
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.network(
                      'https://assets.materialup.com/uploads/97b1abaa-f5b0-49e4-92f2-8ebdf44f5f53/preview.png',
                      fit: BoxFit.fitHeight,
                    );
                  },
                  itemCount: pageCount,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List<Widget>.generate(pageCount, (index) {
                          var selected = index == selectedIndex;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: selected ? 10 : 2,
                              backgroundColor:
                                  selected ? mainColor : Colors.grey,
                            ),
                          );
                        }),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      textColor: Colors.white,
                      highlightElevation: 0,
                      elevation: 0,
                      minWidth: 400,
                      padding: EdgeInsets.all(14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Text("立即登录"),
                      color: mainColor,
                    ),
                    Divider(
                      height: 20,
                      color: Color(0),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      minWidth: 400,
                      textColor: mainColor,
                      padding: EdgeInsets.all(14),
                      child: Text("马上注册"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        side: BorderSide(color: mainColor),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
