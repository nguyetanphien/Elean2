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
  TextEditingController emailController = TextEditingController();
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
  String checkvalidateName = '';
  String checkvalidatePhone = '';
  String checkvalidateDate = '';
  String checkvalidateEmail = '';
  String checkvalidateUniversity = '';
  String checkvalidateSpecialized = '';
  String checkvalidateType = '';
  String checkvalidateExperience = '';
  String checkvalidateCompany = '';
  String checkvalidateTitle = '';
  String checkvalidateDescription = '';
  String checkvalidateimageDiploma = '';
  bool checkValidateImfomation = false;
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
    // userModel.userExperience?.add(dataExperience);
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

  void checkValidateExperience() {
    if (companyController.text.isEmpty) {
      checkvalidateCompany = 'Vui lòng nhập tên công ty';
    }
    if (titleController.text.isEmpty) {
      checkvalidateTitle = 'Vui lòng nhập vị trí công việc';
    }
    if (descriptionController.text.isEmpty) {
      checkvalidateDescription = 'Vui lòng nhập mô tả vị trí đã làm việc';
    }
  }

  void checkValidateImformation() {
    if (fullNameController.text.isEmpty) {
      checkvalidateName = 'Vui lòng nhập họ tên';
    }
    if (phoneController.text.isEmpty) {
      checkvalidatePhone = 'Vui lòng nhập số điện thoại';
    }
    if (emailController.text.isEmpty) {
      checkvalidateEmail = 'Vui lòng địa chỉ email';
    }
    if (dateController.text.isEmpty) {
      checkvalidateDate = 'Vui lòng ngày sinh';
    }
    if (universityController.text.isEmpty) {
      checkvalidateUniversity = 'Vui lòng nhập tên trường Đại học/Cao đẳng';
    }
    if (specializedController.text.isEmpty) {
      checkvalidateSpecialized = 'Vui lòng nhập tên chuyên ngành';
    }
    if ((select ?? '').isEmpty) {
      checkvalidateType = 'Vui lòng chọn danh mục giảng dạy';
    }
    if (imageDiploma == null) {
      checkvalidateimageDiploma = 'Vui lòng thêm ảnh bằng cấp để xác minh';
    }
    if (list.isEmpty) {
      checkvalidateExperience = 'Vui lòng thêm kinh nghiệm';
    }
    if (checkImformation == false) {
      onShowImfo('Vui lòng xác nhận tất cả thông tin trên');
    }
    if (fullNameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        dateController.text.isNotEmpty &&
        universityController.text.isNotEmpty &&
        specializedController.text.isNotEmpty &&
        (select ?? '').isNotEmpty &&
        imageDiploma != null &&
        list.isNotEmpty &&
        checkImformation) {
      checkValidateImfomation = true;
    }
    notifyListeners();
  }
}
