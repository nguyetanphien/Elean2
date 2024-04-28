import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kltn/src/model/user_model.dart';

import '../../../base/base_vm.dart';
import '../../../model/experience_model.dart';

class UpdateImformationTearcherVM extends BaseViewModel {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController specializedController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  File? image;
  File? imageDiploma;
  List<String> gender = ['Nam', 'Nữ', 'Khác'];
  String? select;
  UserModel userModel = UserModel();
  List<ExperienceModel> list = [];
  bool checkImformation = false;
  @override
  void onInit() {
    // TODO: implement onInit
  }
  Future<void> getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    notifyListeners();
  }

  Future<void> getImageDiploma() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      imageDiploma = File(pickedFile.path);
    }
    notifyListeners();
  }

  void addExperience() {
    final dataExperience = ExperienceModel()
      ..company = companyController.text
      ..title = titleController.text
      ..description = descriptionController.text;
    companyController.text = '';
    titleController.text = '';
    descriptionController.text = '';
    list.add(dataExperience);
    userModel.userExperience?.add(dataExperience);
    userModel.userExperience = list;
    notifyListeners();
  }

  void editExperience(int index) {
    final dataExperience = ExperienceModel()
      ..company = companyController.text
      ..title = titleController.text
      ..description = descriptionController.text;
    userModel.userExperience?[index] = dataExperience;
    notifyListeners();
  }
}
