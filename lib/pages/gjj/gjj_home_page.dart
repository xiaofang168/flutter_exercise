import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class GjjHomePage extends StatefulWidget {
  @override
  _GjjHomePageState createState() => _GjjHomePageState();
}

class _GjjHomePageState extends State<GjjHomePage> {

  // andorid file:///android_asset/flutter_assets/assets/files/gjj_home.html
  String filePath = 'assets/files/gjj_home.html';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebViewPlus(
            initialUrl: filePath,
            javascriptMode: JavascriptMode.unrestricted
        )
    );
  }

}