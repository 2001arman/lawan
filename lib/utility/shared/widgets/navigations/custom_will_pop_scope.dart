// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class CustomWillPopScope extends StatelessWidget {
  const CustomWillPopScope({
    super.key,
    required this.child,
    this.onWillPop = false,
    required this.action,
  });

  final Widget child;
  final bool onWillPop;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? GestureDetector(
            onPanEnd: (details) {
              if (details.velocity.pixelsPerSecond.dx < 0 ||
                  details.velocity.pixelsPerSecond.dx > 0) {
                if (onWillPop) {
                  action();
                }
              }
            },
            child: WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: child,
            ))
        : WillPopScope(
            child: child,
            onWillPop: () async {
              action();
              return onWillPop;
            });
  }
}
