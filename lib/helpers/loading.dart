import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void configLoading() {
  EasyLoading.instance
    // ..displayDuration = const Duration(seconds: 3)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.blue.shade900
    ..backgroundColor = Colors.grey[200]
    ..indicatorColor = Colors.blueAccent
    ..textColor = Colors.blueAccent
    ..textStyle = const TextStyle(fontSize: 22, fontStyle: FontStyle.italic)
    ..maskColor = Colors.blue.withOpacity(0.0)
    ..userInteractions = false
    ..maskType = EasyLoadingMaskType.custom
    ..dismissOnTap = false;
}