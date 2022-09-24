import 'package:flutter/material.dart';
import 'package:movement_web_dev/AboutPage.dart';
import 'package:movement_web_dev/LoginPage.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(child: Icon(Icons.inbox), children: [
        SpeedDialChild(
          child: Icon(Icons.home),
          backgroundColor: Colors.red,
          label: '主页',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const HomePage(title: "主页")),
              (route) => true),
        ),
        SpeedDialChild(
          child: Icon(Icons.brush),
          backgroundColor: Colors.orange,
          label: '关于',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const AboutPage(title: "关于")),
              (route) => true),
        ),
        SpeedDialChild(
          child: Icon(Icons.logout),
          backgroundColor: Colors.green,
          label: '注销',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginPage(title: "登录")),
              (route) => false),
        ),
      ]),
      body: Center(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          buildTitle(),
        ],
      )),
    );
  }

  Widget buildTitle() {
    return const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          '主页',
          style: TextStyle(fontSize: 42),
        ));
  }
}
