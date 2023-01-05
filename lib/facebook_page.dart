import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'Utility.dart';

class FacebookPage extends StatefulWidget {
  const FacebookPage({super.key});

  @override
  FacebookPageState createState() => FacebookPageState();
}

class FacebookPageState extends State<FacebookPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent(getMobileUserAgent())
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(facebookURL()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Facebook"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.replay,
                color: Colors.white,
              ),
              onPressed: () {
                controller.reload();
              },
            )
          ],
        ),
        body: WebViewWidget(controller: controller));
  }
}
