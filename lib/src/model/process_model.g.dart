// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProcessModel _$ProcessModelFromJson(Map<String, dynamic> json) => ProcessModel()
  ..processCourse = (json['process_Course'] as num?)?.toDouble()
  ..courseInfo = (json['course_info'] as List<dynamic>?)
      ?.map((e) => CourseShemaModel.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$ProcessModelToJson(ProcessModel instance) =>
    <String, dynamic>{
      'process_Course': instance.processCourse,
      'course_info': instance.courseInfo,
    };
