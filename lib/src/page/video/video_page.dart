import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:kltn/src/base/base_page.dart';
import 'package:kltn/src/model/quiz_title_model.dart';
import 'package:kltn/src/page/video/video_vm.dart';
import 'package:kltn/src/page/video/widget/answer_and_question_widget.dart';
import 'package:kltn/src/page/video/widget/quiz_widget.dart';
import 'package:kltn/src/utils/app_colors.dart';
import 'package:video_player/video_player.dart';
import '../detail_course/widget/persisten_header.dart';

class VideoPage extends StatefulWidget {
  final String url;
  final String idCourse;
  final String idVideo;
  final List<QuizTitleModel> idVideoSession;

  const VideoPage({
    Key? key,
    required this.url,
    required this.idCourse,
    required this.idVideo,
    required this.idVideoSession,
  }) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoPage> with MixinBasePage<VideoVM> {
  @override
  void dispose() {
    super.dispose();
    provider.chewieController.dispose();
    provider.chewieController.videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return builder(
      () => DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: CustomScrollView(
              shrinkWrap: true,
              slivers: [
                SliverPersistentHeader(
                  delegate: PersistentHeader(
                    height: 221,
                    widget: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Chewie(
                        controller: provider.chewieController,
                      ),
                    ),
                  ),
                  pinned: true,
                ),
                SliverPersistentHeader(
                  delegate: PersistentHeader(
                    height: 47,
                    widget: Container(
                      color: Colors.white,
                      child: TabBar(
                        onTap: (value) {
                          setState(() {
                            provider.index = value;
                          });
                        },
                        indicatorPadding: const EdgeInsets.only(top: 43),
                        indicatorWeight: 0.1,
                        indicator: const BoxDecoration(
                          color: AppColors.blue_246BFD,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                        ),
                        tabs: [
                          Tab(
                            child: Text(
                              'Hỏi & đáp',
                              style: TextStyle(
                                color: provider.index == 0 ? AppColors.blue_246BFD : AppColors.h434343,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Bài tập',
                              style: TextStyle(
                                color: provider.index == 1 ? AppColors.blue_246BFD : AppColors.h434343,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  pinned: true,
                ),
                SliverToBoxAdapter(
                  child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: provider.index == 0
                          ? AnswerAndQuestionWidget(provider: provider)
                          : QuizWidget(
                              provider: provider,
                            ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  VideoVM create() {
    return VideoVM();
  }

  @override
  void initialise(BuildContext context) {
    provider.idCourse = widget.idCourse;
    provider.idVideo = widget.idVideo;
    provider.quizTitleModel = widget.idVideoSession;
    // ignore: deprecated_member_use
    provider.videoPlayerController = VideoPlayerController.network(widget.url);
    provider.chewieController = ChewieController(
      videoPlayerController: provider.videoPlayerController,
      autoPlay: true,
      autoInitialize: true,
      showControls: true,
      aspectRatio: 16 / 9,
      showControlsOnInitialize: false,
      errorBuilder: (context, errorMessage) => Center(
        child: Text(
          errorMessage,
          style: const TextStyle(color: AppColors.blue_246BFD),
        ),
      ),
      placeholder: const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      ),
      materialProgressColors: ChewieProgressColors(
        playedColor: AppColors.blue_246BFD,
        handleColor: Colors.white,
        backgroundColor: Colors.grey,
        bufferedColor: AppColors.blue_246BFD.withOpacity(0.2),
      ),
      optionsTranslation: OptionsTranslation(
        playbackSpeedButtonText: 'Tốc độ phát',
        cancelButtonText: 'Hủy',
      ),
      looping: true,
    );
  }
}
