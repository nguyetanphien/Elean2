// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_respone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpRespone _$OtpResponeFromJson(Map<String, dynamic> json) => OtpRespone()
  ..id = json['_id'] as String?
  ..userName = json['user_name'] as String?
  ..userEmail = json['user_email'] as String?;

Map<String, dynamic> _$OtpResponeToJson(OtpRespone instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user_name': instance.userName,
      'user_email': instance.userEmail,
    };
