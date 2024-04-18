import 'package:flutter/widgets.dart';
import 'package:kltn/src/base/base_vm.dart';

class MyCourseVM extends BaseViewModel {
  List<String> item = ['Đang học', 'Hoàn thành'];
  int index = 0;
  ScrollController ongoingControler = ScrollController();
  ScrollController completedController = ScrollController();
  bool isLoadingCompleted = true;
  bool isLoadingOnging = true;
  @override
  void onInit() {
    // TODO: implement onInit
  }
}
