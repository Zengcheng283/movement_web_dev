// ignore_for_file: file_names, sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
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
      floatingActionButton: SpeedDial(
          overlayColor: Colors.grey,
          child: Icon(Icons.inbox),
          children: [
            SpeedDialChild(
                child: const Icon(Icons.home),
                backgroundColor: Colors.blue,
                label: '主页',
                labelStyle: Theme.of(context).textTheme.bodyText1,
                onTap: () => Navigator.of(context).pushNamed("/Home")),
            SpeedDialChild(
                child: const Icon(Icons.brush),
                backgroundColor: Colors.blue,
                label: '关于',
                labelStyle: Theme.of(context).textTheme.bodyText1,
                onTap: () => Navigator.of(context).pushNamed("/About")),
            SpeedDialChild(
              child: const Icon(Icons.logout),
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
              buildTitle(context),
            ],
          )),
    );
  }

  Widget buildTitle(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Text('主页', style: Theme.of(context).textTheme.headline1));
  }
}
