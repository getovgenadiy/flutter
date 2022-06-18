import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _controler = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Getov\'s website'),
        ),
        body: WebView(
          initialUrl: 'https://kiloloco.com',
          onWebViewCreated: (webControler) => _controler.complete(webControler),
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.secondary,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 20),
            child: ButtonBar(
              children: [
                navigationButton(Icons.chevron_left, (webControler) => _goBack(webControler)),
                navigationButton(Icons.chevron_right,(webControler) => _goFprward(webControler))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navigationButton(
      IconData icon, Function(WebViewController) onPressed) {
    return FutureBuilder(
        future: _controler.future,
        builder: (context, AsyncSnapshot<WebViewController> snapshot) {
          if (snapshot.hasData) {
            return IconButton(
                icon: Icon(
                  icon,
                  color: Colors.white,
                ),
                onPressed: () => onPressed(snapshot.data!));
          } else {
            return Container();
          }
        });
  }

  void _goBack(WebViewController webControler) async {

    final canGoBack = await webControler.canGoBack();
    if(canGoBack){
      webControler.goBack();
    }

  }

  void _goFprward(WebViewController webControler) async {

    final canGoForward = await webControler.canGoForward();
    if(canGoForward){
      webControler.goForward();
    }

  }
}
