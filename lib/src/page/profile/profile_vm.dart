import 'package:kltn/src/base/base_vm.dart';

class ProfileVM extends BaseViewModel {
  @override
  void onInit() {}
  void removeToken() {
    prefs.removeToken();
    prefs.removeUserName();
    prefs.removeUserID();
  }
}
