// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_shema_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseShemaModel _$CourseShemaModelFromJson(Map<String, dynamic> json) =>
    CourseShemaModel()
      ..id = json['_id'] as String?
      ..courseName = json['course_name'] as String?
      ..courseType = json['course_type'] as String?
      ..courseThumnail = json['course_thumnail'] as String?
      ..coursePrice = json['course_price'] as int?
      ..courseRatingsAverage =
          (json['course_ratingsAverage'] as num?)?.toDouble()
      ..coursePurchased = json['course_purchased'] as int?;

Map<String, dynamic> _$CourseShemaModelToJson(CourseShemaModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'course_name': instance.courseName,
      'course_type': instance.courseType,
      'course_thumnail': instance.courseThumnail,
      'course_price': instance.coursePrice,
      'course_ratingsAverage': instance.courseRatingsAverage,
      'course_purchased': instance.coursePurchased,
    };
