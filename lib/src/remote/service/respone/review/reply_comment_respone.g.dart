// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply_comment_respone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplyCommentResponse _$ReplyCommentResponseFromJson(
        Map<String, dynamic> json) =>
    ReplyCommentResponse()
      ..id = json['_id'] as String?
      ..userId = json['userId'] == null
          ? null
          : UserModel.fromJson(json['userId'] as Map<String, dynamic>)
      ..replyComment = json['reply_comment'] as String?
      ..createdAt = json['createdAt'] as String?;

Map<String, dynamic> _$ReplyCommentResponseToJson(
        ReplyCommentResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'reply_comment': instance.replyComment,
      'createdAt': instance.createdAt,
    };
