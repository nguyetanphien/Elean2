import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:kltn/src/base/base_vm.dart';
import 'package:kltn/src/model/user_model.dart';

class ProfileVM extends BaseViewModel {
  UserModel userModel = UserModel();
  String avatar = '';
  String name = '';
  @override
  void onInit() {
    getUser();
  }

  void removeToken() {
    prefs.removeToken();
    prefs.removeUserName();
    prefs.removeUserID();
    prefs.removerRole();
    prefs.removeUpdate();
  }

  Future<void> getUser() async {
    // showLoading();
    // notifyListeners();

    try {
      final response = await api.apiServices
          .getUser({'x-atoken-id': prefs.token.toString()}, {'x-client-id': prefs.userID.toString()});
      if (response.status! >= 200 || response.status! < 400) {
        userModel = response.data ?? UserModel();
        name = response.data?.userName ?? '';
        avatar = response.data?.userAvatar ?? '';
      }
      // hideLoading();
      notifyListeners();
    } on DioException catch (e) {
      log(e.message ?? "");
    }
  }
}
