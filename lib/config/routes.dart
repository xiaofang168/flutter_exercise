import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './route_handlers.dart';

class Routes {
  static String root = "/";
  static String userAuditList = "/user_audit_list";
  static String setting = "/setting";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
    router.define(root, handler: homeHandler);
    router.define(userAuditList, handler: userAuditListHandler);
    router.define(setting, handler: settingHandler);
  }
}
