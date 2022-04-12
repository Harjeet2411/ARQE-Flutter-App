import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SearchPage extends StatefulWidget {
 const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ARQe"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: WebView(
            // ignore: prefer_collection_literals
            gestureRecognizers: Set()
              ..add(
                Factory<VerticalDragGestureRecognizer>(
                  () => VerticalDragGestureRecognizer(),
                ), // or null
              ),
            gestureNavigationEnabled: true,
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: "http://5f19-34-125-201-42.ngrok.io",
            onWebViewCreated: ((WebViewController webViewController) {
              _completer.complete(webViewController);
            }),
          ),
        ),
      ),
    );
  }
}
