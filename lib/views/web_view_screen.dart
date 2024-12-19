import 'package:flutter/material.dart';
import 'package:news_app/components/common/circular_loader.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key, required this.url});
  final String url;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController _webViewController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  void _initializeWebView() async {
    _webViewController = WebViewController();

    await _webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);

    _webViewController.setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (url) {
          // Show loading indicator when the page starts loading
          setState(() {
            isLoading = true;
          });
        },
        onPageFinished: (url) {
          // Hide loading indicator when the page finishes loading
          setState(() {
            isLoading = false;
          });
        },
        onWebResourceError: (error) {
          // Handle any errors while loading
          print("Error loading web resource: $error");
        },
      ),
    );


    _webViewController.loadRequest(Uri.parse(widget.url));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: !isLoading ? WebViewWidget(controller: _webViewController) : const CircularLoader()),
    );
  }
}
