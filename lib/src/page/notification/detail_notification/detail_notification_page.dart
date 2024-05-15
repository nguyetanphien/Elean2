import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class DetailNotificationPage extends StatefulWidget {
  const DetailNotificationPage({super.key, required this.description, required this.title});
  final String title;
  final String description;

  @override
  State<DetailNotificationPage> createState() => _DetailNotificationPageState();
}

class _DetailNotificationPageState extends State<DetailNotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 80,
        backgroundColor: AppColors.blue_246BFD,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40), border: Border.all(color: AppColors.white, width: 0.5)),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        title: const Text(
          'Chi tiết thông báo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        width: double.infinity,
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            'assets/image/logo.png',
            height: 90,
            width: 90,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            widget.title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),
          )
        ]),
      ),
    );
  }
}