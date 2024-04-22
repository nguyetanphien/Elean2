import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:kltn/src/base/base_vm.dart';
import 'package:kltn/src/model/course_intro_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DetailCourseTypeVM extends BaseViewModel {
  List<CourseIntroModel> listCourseType = [];
  // VoidCallback? voidCallback;
  RefreshController refreshController = RefreshController();
  String id = '';
  int page = 1;
  bool isLoaading = true;

  @override
  void onInit() {
    if (id.isNotEmpty) {
      fetchCourseByType(refresh: true);
    }
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  Future fetchCourseByType({required bool refresh}) async {
    // showLoading();
    if (refresh) {
      page = 1;
      isLoaading = true;
    } else {
      page = page + 1;
    }
    try {
      final response = await api.apiServices.getAllCourseToType(id, 10, page);
      if (response.status == 200) {
        if (refresh) {
          isLoaading = false;
          listCourseType.clear();
          listCourseType.addAll(response.data ?? []);
          refreshController.resetNoData();
          refreshController.refreshCompleted();
        } else {
          if (response.data!.isNotEmpty) {
            isLoaading = false;
            listCourseType.addAll(response.data ?? []);
            refreshController.loadNoData();
            refreshController.loadComplete();
          } else {
            isLoaading = false;
            refreshController.loadNoData();
          }
        }

        notifyListeners();
        // hideLoading();
      } else {
        showError('Không thể kết nối đến máy chủ.\nVui lòng thử lại.');
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      debugger(when: true, message: e.message);
      showError('Không thể kết nối đến máy chủ.\nVui lòng thử lại.');
    }
  }
}