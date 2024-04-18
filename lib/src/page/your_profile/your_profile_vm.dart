import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kltn/src/base/base_vm.dart';

class YourProfileVM extends BaseViewModel {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateTimeController = TextEditingController();
  List<String> gender = ['Nam', 'Nữ', 'Khác'];
  String? select;
  String checkvalidateName = '';
  String checkvalidatePhone = '';
  String checkvalidateEmail = '';
  File? image;

  @override
  void onInit() {
  }
  Future<void> getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    notifyListeners();
  }
}
