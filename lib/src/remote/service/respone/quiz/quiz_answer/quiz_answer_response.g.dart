// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_answer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizAnswerResponse _$QuizAnswerResponseFromJson(Map<String, dynamic> json) =>
    QuizAnswerResponse()
      ..quizScores = (json['quiz_scores'] as num?)?.toDouble()
      ..printResults = (json['printResults'] as List<dynamic>?)
          ?.map((e) => QuizResponse.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$QuizAnswerResponseToJson(QuizAnswerResponse instance) =>
    <String, dynamic>{
      'quiz_scores': instance.quizScores,
      'printResults': instance.printResults,
    };
