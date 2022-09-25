// ignore_for_file: prefer_const_constructors, sort_child_properties_last, file_names

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
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
      floatingActionButton: SpeedDial(
          overlayColor: Colors.grey,
          child: Icon(Icons.inbox),
          children: [
            SpeedDialChild(
                child: Icon(Icons.home),
                backgroundColor: Colors.blue,
                label: '主页',
                labelStyle: Theme.of(context).textTheme.bodyText1,
                onTap: () => Navigator.of(context).pushNamed("/Home")),
            SpeedDialChild(
                child: Icon(Icons.brush),
                backgroundColor: Colors.blue,
                label: '关于',
                labelStyle: Theme.of(context).textTheme.bodyText1,
                onTap: () => Navigator.of(context).pushNamed("/About")),
            SpeedDialChild(
              child: Icon(Icons.logout),
              backgroundColor: Colors.blue,
              label: '注销',
              labelStyle: Theme.of(context).textTheme.bodyText1,
              onTap: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginPage(title: "登录")),
                  (route) => false),
            ),
          ]),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("img/background.png"), fit: BoxFit.cover),
          ),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              buildTitle(),
            ],
          )),
    );
  }

  Widget buildTitle() {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          '关于',
          style: Theme.of(context).textTheme.headline1,
        ));
  }
}
