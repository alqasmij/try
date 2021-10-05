import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  var UrName;

  var UrUrl;


  WebViewExample(this.UrName, this.UrUrl);

  @override
  _WebViewExampleState createState() => _WebViewExampleState(UrName,UrUrl);
}

final WillPopCallback onWillPop = () {return Future.value(false);};
bool isDisable= true;


class _WebViewExampleState extends State<WebViewExample> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  final name;
  var Url;

  _WebViewExampleState(this.name, this.Url);
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  final _key = UniqueKey();
  bool isLoading = true;
  bool progressChanged = false;
  Color  appBarColor = Color(0xffcc3333);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Directionality(
            textDirection: TextDirection.rtl, // set this property
            child: Scaffold(
              resizeToAvoidBottomInset : false ,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: appBarColor ,
                actions: <Widget>[
                  NavigationControls(_controller.future),
                ],
                title:  Text(name),
              ),
              // We're using a Builder here so we have a context that is below the Scaffold
              // to allow calling Scaffold.of(context) so we can show a snackbar.
              body: Builder(builder: (BuildContext context) {
                return WillPopScope(
                  onWillPop: () async => false,
                  child: Stack(
                    children: <Widget>[
                      WebView(
                        key: _key,
                        initialUrl: Url,
                        javascriptMode: JavascriptMode.unrestricted,
                        onWebViewCreated: (WebViewController webViewController) {
                          _controller.complete(webViewController);
                        },
                        navigationDelegate: (NavigationRequest request) {
                          if (request.url.startsWith('https://www.youtube.com/')) {
                            return NavigationDecision.prevent;
                          }
                          else setState(() {
                            isLoading = true;
                            isDisable = true;
                          });
                          return NavigationDecision.navigate;
                        },
                        onPageStarted: (String url) {
                          print('start');
                        },
                        onPageFinished: (String url) {
                          setState(() {
                            isLoading = false;
                            isDisable = false;
                          });
                        },

                        gestureNavigationEnabled: true,

                      ),
                      isLoading ? Center( child: Align(
                        alignment: Alignment.topCenter,
                        child: LayoutBuilder(
                          builder: (BuildContext context, BoxConstraints constraints) {
                            return Container(
                              height: constraints.maxHeight,
                              width: constraints.maxWidth,
                              color: Color(0xFF0E3311).withOpacity(0.3),
                              child: Container(
                                  height: 40,
                                  child: Image.asset(
                                    "images/Loading (2).gif",height: constraints.maxHeight / 4,width: 5,)
                              ),
                            );
                          },
                        ),
                      ),
                      )
                          : Stack(),
                    ],
                  ),
                );
              }),
            )
        )
    );
  }
}



class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data!;
        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                if (await controller.canGoBack()) {
                  await controller.goBack();
                } else {
                  // ignore: deprecated_member_use
                  Scaffold.of(context).showSnackBar(
                    const SnackBar(content: Text("لا يوجد اي تنقلات للخلف")),
                  );
                  return;
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: !webViewReady ? null : () async {
                if (await controller.canGoForward()) {
                  await controller.goForward();
                } else {
                  // ignore: deprecated_member_use
                  Scaffold.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("لا يوجد اي تنقلات للأمام")),
                  );
                  return;
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: isDisable ? null : () {
                controller.reload();
              },
            ),
          ],
        );
      },
    );
  }
}