// ignore_for_file: file_names, sort_child_properties_last, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movement_web_dev/LoginPage.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _uidController = TextEditingController();
  late String _uid;

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
                image: AssetImage("assets/img/background.png"),
                fit: BoxFit.cover),
          ),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              buildTitle(context),
              fansGet(context),
            ],
          )),
    );
  }

  Widget buildTitle(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Text('主页', style: Theme.of(context).textTheme.headline1));
  }

  Widget fansGet(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8),
        child: TextFormField(
          controller: _uidController,
          style: Theme.of(context).textTheme.bodyText2,
          onSaved: (v) {
            _uid = v!;
          },
          validator: (v) {
            if (v!.isEmpty) {
              return "请输入UID";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: '请输入想要查询的UID',
            labelStyle: TextStyle(color: Colors.white),
            suffixIcon: TextButton(
              child: Text("查询"),
              onPressed: () {
                getDatas(_uidController.text);
              },
            ),
          ),
        ));
  }
}

void getDatas(String uid) async {
  Dio dio = Dio();

  print("http://localhost:4040/x/relation/stat?vmid=$uid&jsonp=jsonp");

  final response =
      await dio.get("http://localhost:4040/x/relation/stat?vmid=11310004");

  if (response.statusCode == HttpStatus.ok) {
    print(response.data);
  } else {
    print("请求失败：${response.statusCode}");
  }
}
