import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'HomePage.dart';
import 'LoginPage.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
          '关于',
          style: TextStyle(fontSize: 42),
        ));
  }
}
