import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kltn/src/base/base_vm.dart';
import 'package:kltn/src/page/main/main_page.dart';

import '../../base/di/locator.dart';
import '../../remote/local/shared_prefs.dart';
import '../../utils/app_colors.dart';
import '../auth/sign_in/sign_in_page.dart';
import '../intro/intro1.dart';
import '../video/video_page.dart';

class SplashVM extends BaseViewModel {
  @override
  void onInit() {}
  void checkIntol(BuildContext context) {
    InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          Timer(const Duration(seconds: 2), () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => (locator<SharedPrefs>().intro == false || locator<SharedPrefs>().intro == null)
                    ? const Intro1()
                    : (locator<SharedPrefs>().token ?? '').isNotEmpty
                        ? MainPage()
                        : const VideoPage(
                            url: '',
                            idCourse: '',
                            idVideo: '',
                          ),
              ),
              (route) => false,
            );
          });

          break;
        case InternetConnectionStatus.disconnected:
          Fluttertoast.showToast(
            msg: 'không có kết nối internet',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: AppColors.blue_246BFD,
            fontSize: 16.0,
          );

          break;
      }
    });
  }

  // Widget showLoading1() {
  //   return Container(
  //     height: 30,
  //     width: 30,
  //     child: showLoading(),
  //   );
  // }
}
