// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sigin_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SigninBody _$SigninBodyFromJson(Map<String, dynamic> json) => SigninBody()
  ..userEmail = json['user_email'] as String?
  ..userPassword = json['user_password'] as String?;

Map<String, dynamic> _$SigninBodyToJson(SigninBody instance) =>
    <String, dynamic>{
      'user_email': instance.userEmail,
      'user_password': instance.userPassword,
    };
