import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/config/application.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("设置"),
      ),
      body: Center(
          child: InkWell(
        child: Text("点击跳转到主页.."),
        onTap: () {
          Application.router.navigateTo(context, "/", transition: TransitionType.inFromRight);
        },
      )),
    );
  }
}
