import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsScreen extends StatelessWidget {
  final String url;
  final String newsTitle;
  NewsDetailsScreen(this.newsTitle, this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newsTitle),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
