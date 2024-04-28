import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kltn/src/base/base_page.dart';
import 'package:kltn/src/page/auth/update_imformation_teacher/widget/list_experience_widget.dart';
import '../../../utils/app_colors.dart';
import '../../your_profile/widgets/item_your_profile.dart';
import 'update_imformation_teacher_vm.dart';

class UpdateImformationTeacherpage extends StatefulWidget {
  const UpdateImformationTeacherpage({super.key});

  @override
  State<UpdateImformationTeacherpage> createState() => _UpdateImformationTeacherpageState();
}

class _UpdateImformationTeacherpageState extends State<UpdateImformationTeacherpage>
    with MixinBasePage<UpdateImformationTearcherVM> {
  @override
  Widget build(BuildContext context) {
    return builder(
      () => Scaffold(
        appBar: AppBar(
          // toolbarHeight: 80,
          backgroundColor: AppColors.blue_246BFD,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40), border: Border.all(color: AppColors.white, width: 0.5)),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          title: const Text(
            'Cập nhật thông tin giảng viên',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      maxRadius: 45,
                      // minRadius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage: provider.image == null
                          // ? provider.avatar.isNotEmpty
                          //     ? NetworkImage(provider.avatar)
                          //     :
                          ? const AssetImage('assets/image/logo.png')
                          : FileImage(provider.image!) as ImageProvider<Object>?,
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {
                          provider.getImage();
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: AppColors.blue_246BFD,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white, width: 1)),
                          child: const Icon(
                            Icons.mode_edit_outline_outlined,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ItemYourProfileWidget(
                controller: provider.fullNameController,
                lable: 'Họ và tên',
                hintText: 'Nhập họ và tên',
                validate: (p0) {
                  // if (p0!.trim().isEmpty || provider.fullNameController.text.isEmpty) {
                  //   setState(() {
                  //     provider.checkvalidateName = 'Vui lòng nhập họ tên';
                  //   });
                  // } else {
                  //   setState(() {
                  //     provider.checkvalidateName = '';
                  //   });
                  // }
                },
              ),
              const SizedBox(
                height: 5,
              ),
              ItemYourProfileWidget(
                controller: provider.phoneController,
                lable: 'Số điện thoại',
                hintText: 'Nhập số điện thoại',
                textInputType: TextInputType.phone,
                validate: (p0) {
                  // if (p0!.trim().isEmpty || provider.fullNameController.text.isEmpty) {
                  //   setState(() {
                  //     provider.checkvalidateName = 'Vui lòng nhập họ tên';
                  //   });
                  // } else {
                  //   setState(() {
                  //     provider.checkvalidateName = '';
                  //   });
                  // }
                },
              ),
              const SizedBox(
                height: 5,
              ),
              ItemYourProfileWidget(
                controller: provider.phoneController,
                lable: 'Email',
                hintText: 'Nhập địa chỉ email',
                textInputType: TextInputType.emailAddress,
                validate: (p0) {
                  // if (p0!.trim().isEmpty || provider.fullNameController.text.isEmpty) {
                  //   setState(() {
                  //     provider.checkvalidateName = 'Vui lòng nhập họ tên';
                  //   });
                  // } else {
                  //   setState(() {
                  //     provider.checkvalidateName = '';
                  //   });
                  // }
                },
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'Ngày sinh',
                    style:
                        TextStyle(color: AppColors.black.withOpacity(0.8), fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(8), color: AppColors.grayE0.withOpacity(0.3)),
                child: TextField(
                  controller: provider.dateController,
                  keyboardType: TextInputType.datetime,
                  readOnly: true,
                  style: const TextStyle(color: AppColors.black, fontSize: 14, fontWeight: FontWeight.w400),
                  decoration: const InputDecoration(
                      hintText: '13/02/2023',
                      suffixIcon: Icon(Icons.date_range_outlined),
                      contentPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 216,
                          padding: const EdgeInsets.only(top: 6.0),
                          margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          color: CupertinoColors.systemBackground.resolveFrom(context),
                          child: SafeArea(
                            top: false,
                            child: CupertinoDatePicker(
                              initialDateTime: DateTime.now(),
                              mode: CupertinoDatePickerMode.date,
                              maximumDate: DateTime.now(),
                              use24hFormat: true,
                              onDateTimeChanged: (DateTime newDate) {
                                setState(() {
                                  var dateTime = DateFormat('dd/MM/yyyy').format(newDate);
                                  provider.dateController.text = dateTime;
                                });
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ItemYourProfileWidget(
                controller: provider.phoneController,
                lable: 'Trường Đại học/Cao đẳng',
                hintText: 'Nhập tên trường Đại học/Cao đẳng',
                validate: (p0) {
                  // if (p0!.trim().isEmpty || provider.fullNameController.text.isEmpty) {
                  //   setState(() {
                  //     provider.checkvalidateName = 'Vui lòng nhập họ tên';
                  //   });
                  // } else {
                  //   setState(() {
                  //     provider.checkvalidateName = '';
                  //   });
                  // }
                },
              ),
              const SizedBox(
                height: 5,
              ),
              ItemYourProfileWidget(
                controller: provider.phoneController,
                lable: 'Chuyên ngành',
                hintText: 'Nhập tên chuyên ngành',
                validate: (p0) {
                  // if (p0!.trim().isEmpty || provider.fullNameController.text.isEmpty) {
                  //   setState(() {
                  //     provider.checkvalidateName = 'Vui lòng nhập họ tên';
                  //   });
                  // } else {
                  //   setState(() {
                  //     provider.checkvalidateName = '';
                  //   });
                  // }
                },
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'Chọn danh mục dạy',
                    style:
                        TextStyle(color: AppColors.black.withOpacity(0.8), fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(8), color: AppColors.grayE0.withOpacity(0.3)),
                child: DropdownButton(
                    isExpanded: true,
                    // isDense: true,
                    value: provider.select,
                    style: const TextStyle(color: AppColors.black, fontSize: 14, fontWeight: FontWeight.w400),
                    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    elevation: 0,
                    underline: Container(),
                    borderRadius: BorderRadius.zero,
                    hint: Text(
                      'Vui lòng chọn giới tính',
                      style: TextStyle(
                          fontSize: 14, color: AppColors.black.withOpacity(0.5), decoration: TextDecoration.none),
                    ),
                    items: provider.gender
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (values) {
                      setState(() {
                        provider.select = values;
                      });
                    }),
              ),
              const SizedBox(
                height: 5,
              ),
              ListExperienceWidget(provider: provider),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'Ảnh bằng cấp',
                    style:
                        TextStyle(color: AppColors.black.withOpacity(0.8), fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              provider.imageDiploma == null
                  ? GestureDetector(
                      onTap: () {
                        provider.getImageDiploma();
                      },
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/image/add_image.png'),
                      ),
                    )
                  : SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.file(
                        provider.imageDiploma!,
                      ),
                    ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Checkbox(
                      value: provider.checkImformation,
                      checkColor: AppColors.blue_246BFD,
                      activeColor: AppColors.white,
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(
                          color: AppColors.blue_246BFD,
                          width: 1.5,
                        ),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      onChanged: (value) {
                        setState(() {
                          provider.checkImformation = value ?? false;
                        });
                      },
                    ),
                  ),
                  const Text(
                    'Xác nhận thông trên là chính xác',
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.blue_246BFD,
                  ),
                  child: const Center(
                    child:
                        Text('Gửi', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  @override
  UpdateImformationTearcherVM create() {
    return UpdateImformationTearcherVM();
  }

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
