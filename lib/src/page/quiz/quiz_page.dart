import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kltn/src/base/base_page.dart';
import 'package:kltn/src/page/quiz/quiz_vm.dart';
import 'package:kltn/src/utils/app_colors.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> with MixinBasePage<QuizVM> {
  @override
  Widget build(BuildContext context) {
    return builder(
      () => Scaffold(
        body: SizedBox(
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 55, left: 15, right: 15),
            child: Stack(
              children: [
                Image.asset('assets/image/quiz_background.png'),
                Positioned(
                  top: 150,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: AppColors.blue_246BFD.withOpacity(0.3),
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                        spreadRadius: 0,
                      ),
                    ]),
                    child: const Column(children: [
                      SizedBox(
                        height: 46,
                      ),
                      Text(
                        'Câu hỏi 13/20',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.blue_246BFD),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        'How many students in your class from korea?',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff2B262D)),
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 115),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 67,
                      width: 67,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white),
                      child: Stack(
                        children: [
                          const SizedBox(
                            height: 65,
                            width: 65,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              color: AppColors.blue_246BFD,
                              strokeWidth: 5,
                              value: 0.9,
                              strokeCap: StrokeCap.square,
                            ),
                          ),
                          Center(
                            child: Text(
                              (provider.currentPage + 1).toString(),
                              style: const TextStyle(
                                  color: AppColors.blue_246BFD, fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  actions: [
                                    const Center(
                                      child: Text(
                                        'Chọn câu hỏi',
                                        style:
                                            TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      children: List.generate(
                                        10,
                                        (i) => GestureDetector(
                                          onTap: () {
                                            provider.goToPage(i);
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: provider.currentPage == i ? AppColors.blue_246BFD : Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: AppColors.blue_246BFD.withOpacity(0.3),
                                                    blurRadius: 4,
                                                    offset: const Offset(0, 4),
                                                    spreadRadius: 0,
                                                  ),
                                                ]),
                                            child: Center(
                                              child: Text(
                                                (i + 1).toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: provider.currentPage == i ? Colors.white : Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: SvgPicture.asset('assets/image/quiz_number.svg'))
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SizedBox(
                    height: 470,
                    child: ScrollConfiguration(
                      behavior: const ScrollBehavior().copyWith(overscroll: false),
                      child: PageView.builder(
                        itemCount: 5,
                        controller: provider.pageController,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (value) {
                          setState(() {
                            provider.currentPage = value;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  itemCount: 4,
                                  scrollDirection: Axis.vertical,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.green,
                                          width: 2,
                                        ),
                                      ),
                                      child: const Row(children: [
                                        Text(
                                          'Dap an',
                                          style:
                                              TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        )
                                      ]),
                                    );
                                  },
                                ),
                              ),
                              Visibility(
                                visible: provider.checkSubmit(),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    // width: 120,
                                    margin: const EdgeInsets.only(bottom: 20),
                                    padding: const EdgeInsetsDirectional.symmetric(vertical: 13),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.blue_246BFD,
                                    ),
                                    child: const Align(
                                        alignment: Alignment.center,
                                        child: Text('Nộp ngay',
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400))),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  QuizVM create() {
    return QuizVM();
  }

  @override
  void initialise(BuildContext context) {}
}
