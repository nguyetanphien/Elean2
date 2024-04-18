import 'package:flutter/material.dart';
import 'package:kltn/src/base/base_page.dart';
import 'package:kltn/src/page/detail_top_mentor/detail_top_mentor_vm.dart';
import 'package:kltn/src/utils/app_colors.dart';

class DetailTopMentorPage extends StatefulWidget {
  const DetailTopMentorPage({super.key});

  @override
  State<DetailTopMentorPage> createState() => _DetailTopMentorPageState();
}

class _DetailTopMentorPageState extends State<DetailTopMentorPage>
    with MixinBasePage<DetailTopMentorVM> {
  @override
  Widget build(BuildContext context) {
    return builder(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: AppColors.gray99, width: 0.5),
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black,
                        size: 20,
                      )),
                ),
              ],
            ),
          ),
          title: Container(
            width: MediaQuery.of(context).size.width,
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width / 5.5),
            child: const Text(
              'Top giảng viên',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        body: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: ListView.builder(
            itemCount: 20,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://th.bing.com/th/id/OIP._wQ5Yn7Oy_1MzUVTUTa-hgHaEK?rs=1&pid=ImgDetMain'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nguyễn Tấn Phiên',
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColors.h333333,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'CNTT',
                          style: TextStyle(
                              fontSize: 10,
                              color: AppColors.h9497AD,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: AppColors.h9497AD.withOpacity(0.2),
                      ),
                      child: const Icon(
                        Icons.phone,
                        color: AppColors.blue_246BFD,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: AppColors.h9497AD.withOpacity(0.2),
                      ),
                      child: const Icon(
                        Icons.chat,
                        color: AppColors.blue_246BFD,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  DetailTopMentorVM create() {
    return DetailTopMentorVM();
  }

  @override
  void initialise(BuildContext context) {}
}
