import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class WebViewPage extends StatefulWidget {
  String url;
  final String title;
  final bool isLocalUrl;

  WebViewController _webViewController;

  WebViewPage({this.url, this.isLocalUrl = false, this.title});

  @override
  _WebViewPage createState() => _WebViewPage();

}

class _WebViewPage extends State<WebViewPage> {

  JavascriptChannel jsBridge(BuildContext context) =>
      JavascriptChannel(
          name: 'jsbridge', // 与h5 端的一致 不然收不到消息
          onMessageReceived: (JavascriptMessage message) async {
            debugPrint(message.message);
          });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppbar(),
        body: _buildBody()
    );
  }

  _buildAppbar() {
    return AppBar(
        elevation: 0,
        backgroundColor: Color(0xccd0d7),
        title: Text(widget.title, style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xFF23ADE5),),
            onPressed: () {

            })
    );
  }

  _buildBody() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 1,
          width: double.infinity,
          child: const DecoratedBox(
              decoration: BoxDecoration(color: Color(0xFFEEEEEE))),
        ),
        Expanded(
          flex: 1,
          child: WebView(
            initialUrl: widget.isLocalUrl ? Uri.dataFromString(
                widget.url, mimeType: 'text/html',
                encoding: Encoding.getByName('utf-8'))
                .toString() : widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            javascriptChannels: <JavascriptChannel>[
              jsBridge(context)
            ].toSet(),
            onWebViewCreated: (WebViewController controller) {
              widget._webViewController = controller;
              if (widget.isLocalUrl) {
                _loadHtmlAssets(controller);
              } else {
                controller.loadUrl(widget.url);
              }
              controller.canGoBack().then((value) =>
                  debugPrint(value.toString()));
              controller.canGoForward().then((value) =>
                  debugPrint(value.toString()));
              controller.currentUrl().then((value) => debugPrint(value));
            },
            onPageFinished: (String value) {
              widget._webViewController.evaluateJavascript('document.title')
                  .then((title) => debugPrint(title));
            },
          ),
        )
      ],
    );
  }

  //加载本地文件
  _loadHtmlAssets(WebViewController controller) async {
    String htmlPath = await rootBundle.loadString(widget.url);
    controller.loadUrl(Uri.dataFromString(
        htmlPath, mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}