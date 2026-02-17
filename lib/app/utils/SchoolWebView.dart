import 'package:bilalschool/app/utils/comman_widget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SchoolWebView extends StatefulWidget {
  const SchoolWebView({super.key});

  @override
  State<SchoolWebView> createState() => _SchoolWebViewState();
}

class _SchoolWebViewState extends State<SchoolWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("https://bilalschool.in/"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bilal School",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: myBackButton(),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
