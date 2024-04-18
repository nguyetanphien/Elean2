// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => CourseModel()
  ..id = json['_id'] as String?
  ..courseDataTitle = json['courseData_title'] as String?
  ..getCourseDataVideo = (json['courseDataVideo'] as List<dynamic>?)
      ?.map((e) => CourseDetailModel.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'courseData_title': instance.courseDataTitle,
      'courseDataVideo': instance.getCourseDataVideo,
    };
