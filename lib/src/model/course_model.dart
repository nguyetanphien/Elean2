import 'package:json_annotation/json_annotation.dart';
import 'package:kltn/src/model/course_detail_model.dart';

part 'course_model.g.dart';

@JsonSerializable()
class CourseModel {
  @JsonKey(name: '_id')
  String? id;

  @JsonKey(name: 'courseData_title')
  String? courseDataTitle;

  @JsonKey(name: 'courseDataVideo')
  List<CourseDetailModel>? getCourseDataVideo;

  CourseModel();

  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseModelToJson(this);
}

