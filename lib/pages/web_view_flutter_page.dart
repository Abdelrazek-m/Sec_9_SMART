import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewFlutterPage extends StatefulWidget {
  const WebViewFlutterPage({super.key});

  @override
  State<WebViewFlutterPage> createState() => _WebViewFlutterPageState();
}

class _WebViewFlutterPageState extends State<WebViewFlutterPage> {
  var control = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://youtube.com/'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('youtube'),
        backgroundColor: Colors.redAccent,
      ),
      body: WebViewWidget(controller: control),
    );
  }
}
