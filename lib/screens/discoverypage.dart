
import 'package:flutter/material.dart';
import 'package:citylolo/tools//toolsUtilities.dart';
import 'package:webview_flutter/webview_flutter.dart';
final webViewKey = GlobalKey<WebViewContainerState>();

class DiscoveryPage extends StatefulWidget {
  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}
class _DiscoveryPageState extends State<DiscoveryPage> with TickerProviderStateMixin  {


  @override
  void initState() {
    super.initState();
    // _controller =  TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 3.0,
        backgroundColor: ToolsUtilities.mainColor,
      ),
      body: WebViewContainer(key: webViewKey),
    );
  }
}

class WebViewContainer extends StatefulWidget {
  WebViewContainer({required Key key}) : super(key: key);

  @override
  WebViewContainerState createState() => WebViewContainerState();
}

class WebViewContainerState extends State<WebViewContainer> {
  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return WebView(
      onWebViewCreated: (controller) {
        _webViewController = controller;
      },
      initialUrl: ToolsUtilities.homePageUrl,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }

  void reloadWebView() {
    _webViewController.reload();
  }
}
