import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'HomePage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // 不显示右上角的 debug
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // 注册路由表
        routes: {
          "/": (BuildContext context) => new LoginPage(title: "登录"), // 首页路由
          "/Home": (BuildContext context) => new HomePage(title: "主页"), // 主页路由
        });
  }
}
