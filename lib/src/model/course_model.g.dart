// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => CourseModel()
  ..id = json['_id'] as String?
  ..courseDataTitle = json['courseData_title'] as String?
  ..courseDataVideo = json['course_data_video'] == null
      ? null
      : CourseDataVideoModel.fromJson(
          json['course_data_video'] as Map<String, dynamic>)
  ..courseDataQuiz = (json['course_data_quiz'] as List<dynamic>?)
      ?.map((e) => QuizTitleModel.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'courseData_title': instance.courseDataTitle,
      'course_data_video': instance.courseDataVideo,
      'course_data_quiz': instance.courseDataQuiz,
    };
