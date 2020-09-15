import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class AgreementPage extends StatefulWidget {
  @override
  _AgreementPageState createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {

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