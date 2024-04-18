import 'package:flutter/material.dart';
import 'package:kltn/src/page/detail_mentor/detail_mentor_vm.dart';

import '../../../utils/app_colors.dart';
import '../../detail_course/detail_course_page.dart';

class CourseMentorWidget extends StatefulWidget {
  const CourseMentorWidget({super.key, required this.provider});
  final DetailMentorVM provider;

  @override
  State<CourseMentorWidget> createState() => _CourseMentorWidgetState();
}

class _CourseMentorWidgetState extends State<CourseMentorWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Khóa học',
                  style: TextStyle(
                      color: AppColors.h434343,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                TextSpan(
                  text: ' (10)',
                  style: TextStyle(
                      color: AppColors.blue_246BFD,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          controller: widget.provider.scrollController,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailCoursePage(id: '65d1b1c66cc4e66e32a6e369',),
                  )),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: AppColors.h8C8C8C.withOpacity(0.4), width: 0.5),
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
                                width: MediaQuery.of(context).size.width - 200,
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
      ],
    );
  }
}
