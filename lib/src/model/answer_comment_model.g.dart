// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerCommentModel _$AnswerCommentModelFromJson(Map<String, dynamic> json) =>
    AnswerCommentModel()
      ..id = json['_id'] as String?
      ..userId = json['userId'] == null
          ? null
          : UserModel.fromJson(json['userId'] as Map<String, dynamic>)
      ..answserComment = json['answser_comment'] as String?
      ..createdAt = json['createdAt'] as String?;

Map<String, dynamic> _$AnswerCommentModelToJson(AnswerCommentModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'answser_comment': instance.answserComment,
      'createdAt': instance.createdAt,
    };
