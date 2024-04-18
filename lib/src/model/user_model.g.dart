// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel()
  ..id = json['_id'] as String?
  ..userName = json['user_name'] as String?
  ..userEmail = json['user_email'] as String?
  ..userAvatar = json['user_avatar'] as String?;

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      '_id': instance.id,
      'user_name': instance.userName,
      'user_email': instance.userEmail,
      'user_avatar': instance.userAvatar,
    };
