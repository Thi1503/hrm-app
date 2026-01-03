import 'package:flutter/cupertino.dart';

List<Widget> addSeparator({
  required Iterable<Widget> children,
  required Widget spacer,
}) {
  return children
      .expand((item) sync* {
        yield spacer;
        yield item;
      })
      .skip(1)
      .toList();
}
