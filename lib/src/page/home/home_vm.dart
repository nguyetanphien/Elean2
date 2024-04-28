import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kltn/src/base/base_vm.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../model/course_shema_model.dart';
import '../../model/course_type_model.dart';
import '../../model/process_model.dart';
import '../../remote/service/respone/course_process/course_process_response.dart';

class HomeVM extends BaseViewModel {
  ScrollController scrollController = ScrollController();
  List<CourseTypeModel> listTypeModel = [];
  List<CourseShemaModel> listPopularCourse = [];
  RefreshController refreshPopularController = RefreshController();
  RefreshController refreshALlController = RefreshController();
  bool isLoadingCatelory = true;
  bool isLoadingCourse = true;
  bool isLoadingTopMentor = true;
  bool isLoadingContinue = true;
  bool isLoadingUser = true;
  String userName = '';
  bool isLogIn = true;
  int pagePopular = 1;
  bool isEnablePullUpPopular = true;

  CourseProcessResponse modelProcess = CourseProcessResponse();
  List<ProcessModel> modelProcessOngoing = [];
  @override
  Future<void> onInit() async {
    await fetchTypeAll();
    fetchPopularCourse(isRefresh: true);
    checkUser();
    fetchCourse();
    if (prefs.token == null) {
      isLogIn = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void refeshAll() {
    isLoadingUser = true;
    isLoadingCatelory = true;
    isLoadingCourse = true;
    isLoadingTopMentor = true;
    isLoadingContinue = true;
    checkUser();
    fetchTypeAll();
    fetchPopularCourse(isRefresh: true);
    fetchCourse();
    refreshALlController.resetNoData();
    refreshALlController.refreshCompleted();
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

  ///
  /// lấy khóa học phổ biến
  Future fetchPopularCourse({required bool isRefresh}) async {
    if (isRefresh) {
      pagePopular = 1;
      isEnablePullUpPopular = true;
    } else {
      pagePopular++;
    }
    try {
      final response = await api.apiServices.getpopularCourse(10, pagePopular);
      if (response.status == 200) {
        if (isRefresh) {
          listPopularCourse.clear();
          listPopularCourse.addAll(response.data ?? []);
          refreshPopularController.resetNoData();
          refreshPopularController.refreshCompleted();
        } else {
          if (response.data!.isNotEmpty) {
            listPopularCourse.addAll(response.data ?? []);
            refreshPopularController.loadNoData();
            refreshPopularController.loadComplete();
          } else {
            isEnablePullUpPopular = false;
            notifyListeners();
            refreshPopularController.loadNoData();
          }
        }
        // listPopularCourse.clear();
        // listPopularCourse.addAll(response.data ?? []);
        isLoadingCourse = false;
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

  ///
  /// lấy thông tin khóa học đang học
  ///
  Future fetchCourse() async {
    try {
      final response = await api.apiServices.getCourseProcess(
        {'x-atoken-id': prefs.token},
        {'x-client-id': prefs.userID},
      );
      if (response.status! >= 200 || response.status! < 400) {
        modelProcess = response.data?.first ?? CourseProcessResponse();
        modelProcessOngoing.clear();
        for (var element in modelProcess.userCourse ?? []) {
          if (element.processCourse <= 1) {
            modelProcessOngoing.add(element);
          }
        }
        isLoadingContinue = false;
        notifyListeners();
        hideLoading();
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      log(e.message.toString());
    }
  }
}
