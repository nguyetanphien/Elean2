import 'package:flutter/material.dart';
import 'package:kltn/src/base/base_page.dart';
import 'package:kltn/src/page/detail_course/detail_course_page.dart';
import 'package:kltn/src/page/detail_popular_course/detail_popular_couse_vm.dart';
import 'package:kltn/src/utils/app_colors.dart';

class DetailPopularCoursePage extends StatefulWidget {
  const DetailPopularCoursePage({super.key});

  @override
  State<DetailPopularCoursePage> createState() =>
      _DetailPopularCoursePageState();
}

class _DetailPopularCoursePageState extends State<DetailPopularCoursePage>
    with MixinBasePage<DetailPopularCourseVM> {
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
                EdgeInsets.only(left: MediaQuery.of(context).size.width / 7),
            child: const Text(
              'Khóa học phổ biến',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              // controller: widget.provider.ongoingControler,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // widget.provider.ongoingControler = ScrollController();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailCoursePage(id: '65d1b1c66cc4e66e32a6e369',),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: AppColors.h8C8C8C.withOpacity(0.4),
                            width: 0.5),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://th.bing.com/th/id/OIP._wQ5Yn7Oy_1MzUVTUTa-hgHaEK?rs=1&pid=ImgDetMain'),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // width: 50,
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.amber.withOpacity(0.2)),
                                child: const Text('Code',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.amber,
                                        fontWeight: FontWeight.w400)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Khóa học Flutter',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: AppColors.h8C8C8C,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Nguyễn Tấn Phiên',
                                    style: TextStyle(
                                        color: AppColors.h8C8C8C,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 200,
                                    child: LinearProgressIndicator(
                                        minHeight: 10,
                                        value: 0.5,
                                        backgroundColor: AppColors.hECECEC,
                                        color: AppColors.blue_246BFD,
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    '10/20',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.h8C8C8C),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  DetailPopularCourseVM create() {
    return DetailPopularCourseVM();
  }

  @override
  void initialise(BuildContext context) {}
}
