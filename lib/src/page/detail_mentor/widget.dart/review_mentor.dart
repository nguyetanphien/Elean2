import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kltn/src/page/detail_mentor/detail_mentor_vm.dart';

import '../../../utils/app_colors.dart';

class ReviewMentorWidget extends StatefulWidget {
  const ReviewMentorWidget({super.key, required this.provider});
  final DetailMentorVM provider;

  @override
  State<ReviewMentorWidget> createState() => _ReviewMentorWidgetState();
}

class _ReviewMentorWidgetState extends State<ReviewMentorWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: 'Đánh giá ',
                      style: TextStyle(
                        color: AppColors.h434343,
                      ),
                    ),
                    TextSpan(
                      text: '(32)',
                      style: TextStyle(
                        color: AppColors.blue_246BFD,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                ignoreGestures: true,
                itemSize: 15,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  // print(rating);
                },
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                '5.0',
                style: TextStyle(
                    color: AppColors.h8C8C8C,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: ListView.separated(
                controller: widget.provider.scrollController,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://th.bing.com/th/id/OIP._wQ5Yn7Oy_1MzUVTUTa-hgHaEK?rs=1&pid=ImgDetMain'),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Name',
                                  style: TextStyle(
                                      color: AppColors.h434343,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    RatingBar.builder(
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      ignoreGestures: true,
                                      itemSize: 12,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        // print(rating);
                                      },
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      '5.0',
                                      style: TextStyle(
                                          color: AppColors.h8C8C8C,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Spacer(),
                            const Text(
                              '11 tháng trước',
                              style: TextStyle(
                                  color: AppColors.hC4C4C4,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Hay',
                          style: TextStyle(
                              color: AppColors.h8C8C8C,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                      color: AppColors.h9497AD,
                      height: 0,
                    ),
                itemCount: 10),
          )
        ],
      ),
    );
  }
}
