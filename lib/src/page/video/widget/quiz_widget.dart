import 'package:flutter/material.dart';
import 'package:kltn/src/page/quiz/quiz_page.dart';
import 'package:kltn/src/utils/app_colors.dart';

class QuizWidget extends StatefulWidget {
  const QuizWidget({super.key});

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Center(
          child: Text(
            'Kiểm tra kiến thức',
            style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        RichText(
            text: const TextSpan(style: TextStyle(fontSize: 13), children: [
          TextSpan(
            text: 'Tên tài kiểm tra: ',
            style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
          ),
          TextSpan(
            text: 'Tên tài kiểm tra ',
            style:
                TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic),
          )
        ])),
        const SizedBox(
          height: 15,
        ),
        RichText(
            text: const TextSpan(style: TextStyle(fontSize: 13), children: [
          TextSpan(
            text: 'Số lượng: ',
            style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
          ),
          TextSpan(
            text: '20 câu hỏi',
            style:
                TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic),
          )
        ])),
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QuizPage(),
                ),
              );
            },
            child: Container(
              width: 120,
              margin: const EdgeInsets.only(top: 300),
              padding: const EdgeInsetsDirectional.symmetric(vertical: 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.blue_246BFD,
              ),
              child: const Align(
                  alignment: Alignment.center,
                  child: Text('Làm ngay',
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400))),
            ),
          ),
        ),
      ],
    );
  }
}
