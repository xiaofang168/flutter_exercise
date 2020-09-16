import 'package:flutter/material.dart';
import 'package:flutter_app/pages/demo/web_page.dart';

class MyApp extends StatelessWidget {

  String localUrl = 'assets/real_data_help.html';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:WebViewPage(url:localUrl, isLocalUrl: true, title: '加载本地文件'),
    );
  }
}