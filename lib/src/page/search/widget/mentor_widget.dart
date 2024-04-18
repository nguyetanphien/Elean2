import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class MentorWidget extends StatefulWidget {
  const MentorWidget({super.key});

  @override
  State<MentorWidget> createState() => _MentorWidgetState();
}

class _MentorWidgetState extends State<MentorWidget> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ListView.builder(
          itemCount: 20,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
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
    );
  }
}
