import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kltn/src/base/base_vm.dart';

import '../../model/course_type_model.dart';

class HomeVM extends BaseViewModel {
  ScrollController scrollController = ScrollController();
  List<CourseTypeModel> listTypeModel = [];
  bool isLoadingCatelory = true;
  bool isLoadingCourse = true;
  bool isLoadingTopMentor = true;
  bool isLoadingContinue = true;
  bool isLoadingUser = true;
  String userName = '';
  @override
  Future<void> onInit() async {
    await fetchTypeAll();
    checkUser();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future fetchTypeAll() async {
    try {
      final response = await api.apiServices.getCourseType();
      if (response.status == 200) {
        listTypeModel.clear();
        listTypeModel.addAll(response.data ?? []);
        isLoadingCatelory = false;
        notifyListeners();
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      log(e.message.toString());
      showError('Không thể kết nối đến máy chủ.\nVui lòng thử lại.');
    }
  }

  void checkUser() {
    if ((prefs.userName ?? '').isNotEmpty) {
      userName = prefs.userName ?? '';
    } else {
      userName = 'E-Learn';
    }
    isLoadingUser = false;
    notifyListeners();
  }
}
