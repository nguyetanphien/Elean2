import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kltn/src/base/base_page.dart';
import 'package:kltn/src/page/auth/sign_in/sign_in_page.dart';
import 'package:kltn/src/page/change_password.dart/change_password_page.dart';
import 'package:kltn/src/page/profile/profile_vm.dart';
import 'package:kltn/src/page/profile/widgets/item_profile.dart';
import 'package:kltn/src/page/your_profile/your_profile_page.dart';
import 'package:kltn/src/utils/app_colors.dart';

import 'widgets/dialog_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with MixinBasePage<ProfileVM> {
  @override
  Widget build(BuildContext context) {
    return builder(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        // padding: const EdgeInsets.only(top: 100),
                        decoration: const BoxDecoration(
                          color: AppColors.blue_246BFD,
                          // borderRadius: BorderRadius.only(
                          //     bottomLeft: Radius.circular(50),
                          //     bottomRight: Radius.circular(50)),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 200),
                          child: Stack(
                            children: [
                              // Container(
                              //   width: 100,
                              //   height: 100,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(50),
                              //     border:
                              //         Border.all(color: Colors.amber, width: 2),
                              //     image: const DecorationImage(
                              //       image: NetworkImage(
                              //           'https://th.bing.com/th/id/OIP._wQ5Yn7Oy_1MzUVTUTa-hgHaEK?rs=1&pid=ImgDetMain'),
                              //       fit: BoxFit.cover,
                              //     ),
                              //   ),
                              // ),
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: Colors.amber, width: 2),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'https://th.bing.com/th/id/OIP._wQ5Yn7Oy_1MzUVTUTa-hgHaEK?rs=1&pid=ImgDetMain',
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(), // Hiệu ứng loading
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error), // Widget hiển thị khi có lỗi xảy ra
                                  ),
                                ),
                              ),

                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const YourProfilePage(),
                                        ));
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
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Nguyen Tan Phien',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // const SizedBox(
                  //   height: 70,
                  // ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ItemProfileWidget(
                icon: Icons.person_outline,
                title: 'Thông tin của bạn',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const YourProfilePage(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 5,
              ),
              ItemProfileWidget(
                icon: Icons.key,
                title: 'Đổi mật khẩu',
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangePasswordPage(),
                      ));
                },
              ),
              const SizedBox(
                height: 5,
              ),
              ItemProfileWidget(
                icon: Icons.lock_outlined,
                title: 'Chính sách bảo mật',
                ontap: () {},
              ),
              const SizedBox(
                height: 5,
              ),
              ItemProfileWidget(
                icon: Icons.help_outline_rounded,
                title: 'Trung tâm trợ giúp',
                ontap: () {},
              ),
              const SizedBox(
                height: 5,
              ),
              ItemProfileWidget(
                icon: Icons.delete_outlined,
                title: 'Xóa tài khoản',
                ontap: () {},
              ),
              const SizedBox(
                height: 5,
              ),
              ItemProfileWidget(
                icon: Icons.login_outlined,
                title: 'Đăng xuất',
                divider: false,
                ontap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => PlaceholderDialog(
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.red,
                        size: 80.0,
                      ),
                      title: 'Đăng xuất',
                      message: 'Bạn có muốn đăng xuất tài khoản?',
                      actions: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: AppColors.gray99,
                                    ),
                                    child: const Align(
                                        alignment: Alignment.center,
                                        child: Text('Trở về',
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400))),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    provider.removeToken();
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const SignInPage(),
                                        ),
                                        (route) => false);
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: AppColors.blue_246BFD,
                                    ),
                                    child: const Align(
                                        alignment: Alignment.center,
                                        child: Text('Đăng xuất',
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ProfileVM create() {
    return ProfileVM();
  }

  @override
  void initialise(BuildContext context) {}
}
