import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/GoogleLogoPage.dart';
import 'package:flutter_ui/pages/LoginPage.dart';
import 'package:flutter_ui/pages/WechatPage.dart';

// 路由表
final Map<String, WidgetBuilder> routes = {
  WeChatPage.PAGE_NAME: (context) => WeChatPage(),
  LoginPage.PAGE_NAME: (context) => LoginPage(),
  GoogleLogoPage.PAGE_NAME: (context) => GoogleLogoPage(),
};
