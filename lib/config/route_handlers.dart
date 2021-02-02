import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/setting.dart';
import 'package:flutter_app/pages/user/user_audit_list.dart';


var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Home();
    });

var userAuditListHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return UserAuditList();
    });

var settingHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Setting();
    });