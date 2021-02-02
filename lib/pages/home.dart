import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/config/application.dart';
import 'package:flutter_app/config/routes.dart';
import 'package:flutter_app/pages/app_bottom_bar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    // 路由初始化
    Routes.configureRoutes(router);
    Application.router = router;
    return MaterialApp(
      title: "Material",
      theme: new ThemeData(primaryColor: Colors.blue, errorColor: Colors.red),
      debugShowCheckedModeBanner: false,
      home: AppBottomBar(),
      builder: EasyLoading.init(),
      // 路由静态化
      onGenerateRoute: Application.router.generator,
    );
  }
}
