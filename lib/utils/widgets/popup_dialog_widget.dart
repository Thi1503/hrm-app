import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class PopupDialogWidget extends StatefulWidget {
  final String html;

  const PopupDialogWidget({
    super.key,
    required this.html,
  });

  @override
  State<PopupDialogWidget> createState() => _PopupDialogWidgetState();
}

class _PopupDialogWidgetState extends State<PopupDialogWidget> {
  final RxBool isShowLoading = true.obs;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InAppWebView(
          initialData: InAppWebViewInitialData(data: widget.html),
          onLoadStop: (_, __) {
            0.2.delay(() {
              isShowLoading.value = false;
            });
          },
          initialSettings: InAppWebViewSettings(
            javaScriptEnabled: false,
            useHybridComposition: false,
            cacheEnabled: false,
          ),
        ),

        // overlay loading
        Obx(() => isShowLoading.value
            ? const Positioned.fill(
                child: ColoredBox(
                  color: Colors.white,
                  child: Center(child: CupertinoActivityIndicator()),
                ),
              )
            : const SizedBox.shrink()),
      ],
    );
  }
}
