import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kltn/src/base/di/locator.dart';
import 'package:kltn/src/remote/local/shared_prefs.dart';
import 'package:kltn/src/remote/service/body/sigin_body.dart';

import '../../../base/base_vm.dart';

class SignInVM extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String checkValidatePassword = '';
  String checkValidateEmail = '';
  String? email = locator<SharedPrefs>().saveEmail;
  String? password = locator<SharedPrefs>().savePassword;
  bool checkSaveAccount = false;
  Function(String)? callback;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    if ((email ?? '').isNotEmpty) {
      checkSaveAccount = true;
      checkSavaAccount();
    }
  }

  void checkSavaAccount() {
    if (email!.isNotEmpty) {
      emailController.text = email ?? '';
    }
    if (password!.isNotEmpty) {
      passwordController.text = password ?? '';
    }
    notifyListeners();
  }

  void savaAccount() {
    if (checkSaveAccount) {
      prefs.saveEmail = emailController.text;
      prefs.savePassword = passwordController.text;
    } else {
      prefs.removeAccount();
    }
    notifyListeners();
  }

  Future postSignin(BuildContext context) async {
    showLoading();
    final body = SigninBody()
      ..userEmail = emailController.text.trim()
      ..userPassword = passwordController.text;
    try {
      final response = await api.authService.postSignin(body);
      if (response.status! >= 200 || response.status! < 400) {
        prefs.token = response.data?.accessToken ?? '';
        prefs.userID = response.data?.metaData?.id ?? '';
        prefs.userName = response.data?.metaData?.userName ?? '';
        hideLoading();
        notifyListeners();
        callback?.call('');
      } else {
        hideLoading();

        notifyListeners();
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        showError('Mật khẩu không chính xác.');
      } else {
        showError('Tài khoản không tồn tại');
      }
      notifyListeners();
    }
  }
}