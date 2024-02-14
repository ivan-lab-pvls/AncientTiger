import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class TigerScreen extends StatelessWidget {
  const TigerScreen({
    super.key,
    required this.tigerId,
  });
  final String tigerId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(tigerId),
          ),
        ),
      ),
    );
  }
}
