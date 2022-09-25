import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'HomePage.dart';
import 'AboutPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // 不显示右上角的 debug
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 42, color: Colors.white),
            bodyText1: TextStyle(fontSize: 18.0, color: Colors.grey),
            bodyText2: TextStyle(color: Colors.white),
          ),
          primarySwatch: Colors.blue,
        ),
        // 注册路由表
        routes: {
          "/": (context) => const LoginPage(title: "登录"), // 首页路由
          "/Home": (context) => const HomePage(title: "主页"), // 主页路由
          "/About": (context) => const AboutPage(title: "关于"), // 关于页路由
        });
  }
}
