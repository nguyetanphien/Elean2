import 'package:flutter/material.dart';
import 'package:kltn/src/base/base_vm.dart';

class DetailMentorVM extends BaseViewModel {
  int index = 0;
  ScrollController scrollController = ScrollController();
  bool checkReadMore = false;
  bool checkLoading = true;
  @override
  void onInit() {}
}
