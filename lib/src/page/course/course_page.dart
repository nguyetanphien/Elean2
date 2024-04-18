import 'package:flutter/material.dart';
import 'package:kltn/src/base/base_page.dart';
import 'package:kltn/src/model/course_model.dart';
import 'package:kltn/src/page/course/course_vm.dart';

import '../../utils/app_colors.dart';
import '../video/video_page.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key, required this.getCourseData, required this.idCourse});
  final List<CourseModel>? getCourseData;
  final String idCourse;

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> with MixinBasePage<CourseVM> {
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
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 4),
            child: const Text(
              'Bài học',
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
            itemCount: widget.getCourseData?.length,
            controller: provider.scrollController,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final listTitle = widget.getCourseData?[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 100,
                          child: Text(
                            'Phần ${index + 1}: ${listTitle?.courseDataTitle}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          '35 phút',
                          style: TextStyle(
                            color: AppColors.blue_246BFD,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        itemCount: listTitle?.getCourseDataVideo?.length,
                        shrinkWrap: true,
                        controller: provider.scrollController,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width - 50,
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.h9497AD, width: 1),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: AppColors.blue_246BFD.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Text(
                                      (index + 1).toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: AppColors.blue_246BFD,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listTitle?.getCourseDataVideo?[index].videoTitle ?? '',
                                      style: const TextStyle(
                                          color: AppColors.h434343, fontSize: 13, fontWeight: FontWeight.w600),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      provider.convertMillisecondsToSeconds(
                                          listTitle?.getCourseDataVideo?[index].videoLength ?? 0),
                                      style: const TextStyle(
                                          color: AppColors.h9497AD, fontSize: 13, fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return VideoPage(
                                          // provider: provider,
                                          url: listTitle?.getCourseDataVideo?[index].videoUrl ?? '',
                                          idCourse: widget.idCourse,
                                          idVideo: listTitle?.getCourseDataVideo?[index].id ?? '',
                                        );
                                      },
                                    ));
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.blue_246BFD,
                                    ),
                                    child: const Icon(Icons.play_arrow_rounded, color: Colors.white),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                )
                              ],
                            ),
                          );
                        }),
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
  CourseVM create() {
    return CourseVM();
  }

  @override
  void initialise(BuildContext context) {}
}
