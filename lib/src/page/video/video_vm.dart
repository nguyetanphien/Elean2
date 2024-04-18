import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kltn/src/base/base_vm.dart';
import 'package:kltn/src/remote/service/body/answer_body.dart';
import 'package:kltn/src/remote/service/body/question_body.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:video_player/video_player.dart';

import '../../remote/service/respone/answer_and_question/answer_and_question_response.dart';

class VideoVM extends BaseViewModel {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  // late Future<void> initVideoPlayerFuture;
  Map<int, bool> listCheckReply = {};
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();
  RefreshController refreshController = RefreshController();
  List<AnswerAndQuestionRespone> listAnswerAndQuestion = [];
  String idCourse = '';
  String idVideo = '';
  int index = 0;
  bool isLoading = true;
  int pageReview = 1;
  @override
  void onInit() {
    fetchAllQuestionAndAnwser(isRefresh: true);
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  bool? isListDetailVisible(int index) {
    return listCheckReply.containsKey(index) ? listCheckReply[index] : false;
  }

  Duration getCurrentPosition() {
    return videoPlayerController.value.position;
  }

  void playFromSeconds(int seconds) {
    videoPlayerController.seekTo(Duration(seconds: seconds));
    videoPlayerController.play();
  }

  ///
  /// tạo question
  ///
  Future createQuestion() async {
    showLoading();
    if (questionController.text.trim().isEmpty) {
      showError('Vui lòng đặt câu hỏi');
    } else {
      final body = QuestionBody()
        ..courseId = idCourse
        ..questionComment = questionController.text
        ..videoTime = getCurrentPosition().inSeconds;
      try {
        final respone = await api.apiServices
            .createQuestion(idVideo, {'x-atoken-id': prefs.token}, {'x-client-id': prefs.userID}, body);
        if (respone.status! >= 200) {
          fetchAllQuestionAndAnwser(isRefresh: true);
          hideLoading();
          answerController.text = '';
          questionController.text = '';
          showSucces('Tạo câu hỏi thành công');
          notifyListeners();
        }
        // ignore: deprecated_member_use
      } on DioError catch (e) {
        log(e.message.toString());
        if (e.response?.statusCode == 400) {
          showError('Bạn đã phản hồi đánh giá này');
        }
        hideLoading();
      }
    }
  }

  ///
  /// tạo anwser
  ///
  Future createAnwser({required String idQuestion}) async {
    showLoading();
    if (answerController.text.trim().isEmpty) {
      showError('Vui lòng nhập câu trả lời');
    } else {
      final body = AnwserBody()..answserComment = answerController.text;
      try {
        final respone = await api.apiServices
            .createAnwser(idQuestion, {'x-atoken-id': prefs.token}, {'x-client-id': prefs.userID}, body);
        if (respone.status! >= 200) {
          fetchAllQuestionAndAnwser(isRefresh: true);
          hideLoading();
          answerController.text = '';
          questionController.text = '';
          showSucces('Trả lời thành công');
          notifyListeners();
        }
        // ignore: deprecated_member_use
      } on DioError catch (e) {
        log(e.message.toString());
        if (e.response?.statusCode == 400) {
          showError('Bạn đã phản hồi đánh giá này');
        }
        hideLoading();
      }
    }
  }

  ///
  /// lấy câu hỏi và trả lời
  ///
  Future fetchAllQuestionAndAnwser({required bool isRefresh}) async {
    showLoading();
    if (isRefresh) {
      pageReview = 1;
    } else {
      pageReview++;
    }
    notifyListeners();
    try {
      final response = await api.apiServices
          .getQuestionAndAnwser(idVideo, {'x-atoken-id': prefs.token}, {'x-client-id': prefs.userID}, 3, pageReview);
      if (response.status == 200) {
        listCheckReply = {};
        if (isRefresh) {
          listAnswerAndQuestion.clear();
          listAnswerAndQuestion.addAll(response.data ?? []);
          refreshController.resetNoData();
          refreshController.refreshCompleted();
        } else {
          if (response.data!.isNotEmpty) {
            listAnswerAndQuestion.addAll(response.data ?? []);
            refreshController.loadNoData();
            refreshController.loadComplete();
          } else {
            refreshController.loadNoData();
          }
        }
        isLoading = false;
        notifyListeners();
        hideLoading();
      } else {
        showError('Không thể kết nối đến máy chủ.\nVui lòng thử lại.');
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      log(e.message.toString());
      showError('Không thể kết nối đến máy chủ.\nVui lòng thử lại.');
      isLoading = false;
      hideLoading();
    }
  }
}
