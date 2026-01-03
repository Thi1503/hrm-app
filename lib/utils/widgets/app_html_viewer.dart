import 'package:do_an_application/const/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import 'app_scaffold.dart';
import 'util_widgets.dart';

class AppHtmlViewer extends StatefulWidget {
  const AppHtmlViewer({
    super.key,
    required this.title,
    required this.html,
    this.enableJavascript = true,
  });

  final String title;
  final String html;
  final bool enableJavascript;

  @override
  State<AppHtmlViewer> createState() => _AppHtmlViewerState();
}

class _AppHtmlViewerState extends State<AppHtmlViewer> {
  bool isLoadingHtml = true;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: UtilWidgets.buildAppBar(
        title: widget.title,
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialData: InAppWebViewInitialData(
              data: widget.html,
            ),
            onLoadStop: (_, __) {
              0.2.delay(() {
                if (!mounted) {
                  return;
                }
                setState(() {
                  isLoadingHtml = false;
                });
              });
            },
            // Disable some features to improve performance
            initialSettings: InAppWebViewSettings(
              javaScriptEnabled: widget.enableJavascript,
              useHybridComposition: false,
              cacheEnabled: false,
            ),
          ),
          if (isLoadingHtml)
            Positioned.fill(
              child: Container(
                color: AppColors.scaffoldBackgroundColor,
                child: const Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
