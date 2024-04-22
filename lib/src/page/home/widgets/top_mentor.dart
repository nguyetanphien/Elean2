import 'package:flutter/material.dart';
import 'package:kltn/src/page/detail_mentor/detail_mentor_page.dart';
import 'package:kltn/src/page/detail_top_mentor/detail_top_mentor_page.dart';
import 'package:kltn/src/page/home/home_vm.dart';
import 'package:shimmer/shimmer.dart';

class TopMentorWidget extends StatefulWidget {
  const TopMentorWidget({super.key, required this.provider});
  final HomeVM provider;

  @override
  State<TopMentorWidget> createState() => _TopMentorWidgetState();
}

class _TopMentorWidgetState extends State<TopMentorWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Text(
                'Top giảng viên',
                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              !widget.provider.isLoadingTopMentor
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailTopMentorPage(),
                            ));
                      },
                      child: const Text(
                        'Xem tất cả',
                        style: TextStyle(fontSize: 12, color: Colors.amber, fontWeight: FontWeight.w400),
                      ))
                  : Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 10,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          !widget.provider.isLoadingTopMentor
              ? SizedBox(
                  height: (MediaQuery.of(context).size.width / 4) + 20,
                  child: ScrollConfiguration(
                    behavior: const ScrollBehavior().copyWith(overscroll: false),
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20, top: 20),
                          child: InkResponse(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DetailMentorPage(
                                    idMentor: '',
                                  ),
                                )),
                            child: Column(
                              children: [
                                Container(
                                  height: (MediaQuery.of(context).size.width - 90) / 4,
                                  width: (MediaQuery.of(context).size.width - 90) / 4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              'https://th.bing.com/th/id/OIP._wQ5Yn7Oy_1MzUVTUTa-hgHaEK?rs=1&pid=ImgDetMain'),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                const Text(
                                  'Kinh doanh',
                                  style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              : SizedBox(
                  height: (MediaQuery.of(context).size.width / 4) + 20,
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: (10 - index == 1) ? 0 : 20, top: 20),
                        child: Column(
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                height: (MediaQuery.of(context).size.width - 90) / 4,
                                width: (MediaQuery.of(context).size.width - 90) / 4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 7),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                height: 10,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
