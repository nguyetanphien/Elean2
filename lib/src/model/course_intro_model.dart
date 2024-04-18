import 'package:json_annotation/json_annotation.dart';

part 'course_intro_model.g.dart';

@JsonSerializable()
class CourseIntroModel {
  @JsonKey(name: '_id')
  String? id;

  @JsonKey(name: 'course_name')
  String? courseName;

  @JsonKey(name: 'course_thumnail')
  String? courseThumnail;

  @JsonKey(name: 'course_price')
  int? coursePrice;

  @JsonKey(name: 'course_ratingsAverage')
  double? courseRatingsAverage;

  CourseIntroModel();

  factory CourseIntroModel.fromJson(Map<String, dynamic> json) =>
      _$CourseIntroModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseIntroModelToJson(this);
}
