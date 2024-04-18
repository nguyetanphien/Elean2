import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: '_id')
  String? id;

  @JsonKey(name: 'user_name')
  String? userName;

  @JsonKey(name: 'user_email')
  String? userEmail;
  
  @JsonKey(name: 'user_avatar')
  String? userAvatar;

  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
