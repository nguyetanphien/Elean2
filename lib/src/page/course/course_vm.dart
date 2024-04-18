import 'package:flutter/material.dart';
import 'package:kltn/src/base/base_vm.dart';

class CourseVM extends BaseViewModel {
  bool checkPlay = true;
  ScrollController scrollController = ScrollController();
  @override
  void onInit() {}

  String convertMillisecondsToSeconds(double value) {
    int seconds = value.floor();
    int sec = seconds % 60;
    int min = (seconds / 60).floor();
    String minute = min.toString().padLeft(2, '0');
    String second = sec.toString().padLeft(2, '0');
    return "$minute:$second";
  }
}
