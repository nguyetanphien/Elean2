// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_and_question_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerAndQuestionRespone _$AnswerAndQuestionResponeFromJson(
        Map<String, dynamic> json) =>
    AnswerAndQuestionRespone()
      ..id = json['_id'] as String?
      ..userId = json['userId'] == null
          ? null
          : UserModel.fromJson(json['userId'] as Map<String, dynamic>)
      ..questionComment = json['question_comment'] as String?
      ..videoTime = json['video_time'] as int?
      ..createdAt = json['createdAt'] as String?
      ..answserComment = (json['answser_comment'] as List<dynamic>?)
          ?.map((e) => AnswerCommentModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AnswerAndQuestionResponeToJson(
        AnswerAndQuestionRespone instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'question_comment': instance.questionComment,
      'video_time': instance.videoTime,
      'createdAt': instance.createdAt,
      'answser_comment': instance.answserComment,
    };
