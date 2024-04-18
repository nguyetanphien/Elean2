import 'package:flutter/cupertino.dart';
import 'package:kltn/src/base/base_vm.dart';

class ChangePasswordVM extends BaseViewModel {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  String checkCurentpassword = '';
  String checknewpassword = '';
  String checkconfirmpassword = '';
  bool checkCurenPassword = false;
  bool checkNewPassword = false;
  bool checkConfirmPassword = false;
  @override
  void onInit() {
  }
  String check(String p0) {
    if (p0.isEmpty) {
      notifyListeners();
      return 'Vui lòng nhập mật khẩu';
    } else if (p0.length < 6) {
      notifyListeners();
      return 'Vui lòng nhập mật khẩu lớn hơn 6 ký tự';
    }
    notifyListeners();
    return '';
  }
}
