// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_imformation_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateImfomationBody _$UpdateImfomationBodyFromJson(Map<String, dynamic> json) => UpdateImfomationBody()
  ..userName = json['user_name'] as String?
  ..userExperience = (json['user_experience'] as List<dynamic>?)
      ?.map((e) => ExperienceModel.fromJson(e as Map<String, dynamic>))
      .toList()
  ..userAvatar = json['user_avatar'] as String?
  ..userAbout = json['user_about'] as String?
  ..userPhone = json['user_phone'] as String?
  ..userBirthday = json['user_birthday'] as String?
  ..userUniversity = json['user_university'] as String?
  ..courseTtype = json['course_type'] as String?
  ..userMajor = json['user_major'] as String?
  ..userDiploma = json['user_diploma'] as String?;

Map<String, dynamic> _$UpdateImfomationBodyToJson(UpdateImfomationBody instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'user_experience': instance.userExperience,
      'user_avatar': instance.userAvatar,
      'user_about': instance.userAbout,
      'user_phone': instance.userPhone,
      'user_birthday': instance.userBirthday,
      'user_university': instance.userUniversity,
      'course_type': instance.courseTtype,
      'user_diploma': instance.userDiploma,
      'user_major': instance.userMajor,
    };
