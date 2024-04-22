import 'package:flutter/material.dart';
import 'package:kltn/src/page/detail_course/detail_course_vm.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/app_colors.dart';
import '../../video/video_page.dart';

class LessonWidget extends StatefulWidget {
  const LessonWidget({super.key, required this.provider});
  final DetailCourseVM provider;

  @override
  State<LessonWidget> createState() => _LessonWidgetState();
}

class _LessonWidgetState extends State<LessonWidget> {
  @override
  Widget build(BuildContext context) {
    return !widget.provider.isLoading
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  children: [
                    const TextSpan(
                      text: 'Bài giảng ',
                      style: TextStyle(
                        color: AppColors.h434343,
                      ),
                    ),
                    TextSpan(
                      text: (widget.provider.listData.length).toString(),
                      style: const TextStyle(
                        color: AppColors.blue_246BFD,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(overscroll: false),
                child: ListView.builder(
                  controller: widget.provider.scrollController,
                  itemCount: widget.provider.listData.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final list = widget.provider.listData[index];
                    return ExpansionTile(
                      tilePadding: const EdgeInsets.all(0),
                      childrenPadding: EdgeInsets.zero,
                      title: Text("Phần ${index + 1} : ${list.courseDataTitle ?? ''}",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 61, 62, 66),
                              fontSize: 14,
                              height: 1.5,
                              fontWeight: FontWeight.w500)),
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          controller: widget.provider.scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                                widget.provider.listData[index].courseDataVideo?.courseVideo?.length ?? 10, (index) {
                              final check = list.courseDataVideo?.courseVideo?[index].videoUrl?.isEmpty;
                              return GestureDetector(
                                onTap: !(check ?? true)
                                    ? () {
                                        Navigator.push(context, MaterialPageRoute(
                                          builder: (context) {
                                            return VideoPage(
                                              url: list.courseDataVideo?.courseVideo?[index].videoUrl ?? '',
                                              idCourse: list.id ?? '',
                                              idVideo: list.courseDataVideo?.courseVideo?[index].id ?? '',
                                              idVideoSession: list.courseDataQuiz ?? [],
                                            );
                                          },
                                        ));
                                      }
                                    : () {},
                                child: Container(
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
                                            list.courseDataVideo?.courseVideo?[index].videoTitle ?? '',
                                            style: const TextStyle(
                                                color: AppColors.h434343, fontSize: 13, fontWeight: FontWeight.w600),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            (widget.provider.convertMillisecondsToSeconds(
                                                    list.courseDataVideo?.courseVideo?[index].videoLength ?? 0))
                                                .toString(),
                                            style: const TextStyle(
                                                color: AppColors.h9497AD, fontSize: 13, fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                      const Spacer(),
                                      Visibility(
                                        visible: !(check ?? true),
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: AppColors.blue_246BFD,
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return VideoPage(
                                                      url: list.courseDataVideo?.courseVideo?[index].videoUrl ?? '',
                                                      idCourse: widget.provider.model.id ?? '',
                                                      idVideo: list.courseDataVideo?.courseVideo?[index].id ?? '',
                                                      idVideoSession: list.courseDataQuiz ?? [],
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                            child: const Icon(Icons.play_arrow_rounded, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: (check ?? true),
                                        child: const Icon(
                                          Icons.lock,
                                          size: 25,
                                          color: AppColors.h8C8C8C,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          )
        : Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              children: List.generate(10, (i) {
                return Container(
                  height: 50,
                  margin: const EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(10)),
                );
              }),
            ),
          );
    ;
  }
}