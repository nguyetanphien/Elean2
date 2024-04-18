// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseTypeModel _$CourseTypeModelFromJson(Map<String, dynamic> json) =>
    CourseTypeModel()
      ..id = json['_id'] as String?
      ..typeName = json['type_name'] as String?;

Map<String, dynamic> _$CourseTypeModelToJson(CourseTypeModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'type_name': instance.typeName,
    };
