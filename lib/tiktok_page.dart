import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'Utility.dart';

class TiktokPage extends StatefulWidget {
  const TiktokPage({super.key});

  @override
  TiktokPageState createState() => TiktokPageState();
}

class TiktokPageState extends State<TiktokPage> {
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
      ..loadRequest(Uri.parse(tiktokURL()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tiktok"),
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
