import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../base/base_vm.dart';

class QuizVM extends BaseViewModel {
  int currentPage = 0;

  PageController pageController = PageController(initialPage: 0);
  @override
  void onInit() {
    Fluttertoast.showToast(msg: 'Cuộn sang phải để qua câu tiếp theo');
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  // Trong class QuizVM
  void goToPage(int page) {
    currentPage = page;
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    notifyListeners();
  }

  bool checkSubmit() {
    if (currentPage == 4) {
      return true;
    }
    return false;
  }
}
