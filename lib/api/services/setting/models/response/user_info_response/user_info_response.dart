import 'package:json_annotation/json_annotation.dart';

part 'user_info_response.g.dart';

@JsonSerializable()
class UserInfoResponse {
  String? token;
  String? apiRole;
  dynamic staff;
  dynamic gender;
  dynamic position;
  dynamic genderName;
  int? userId;
  int? type;
  String? account;
  dynamic title;
  String? firstName;
  String? lastName;
  int? status;
  int? parentUserId;
  dynamic zaloId;
  int? staffId;

  UserInfoResponse({
    this.token,
    this.apiRole,
    this.staff,
    this.gender,
    this.position,
    this.genderName,
    this.userId,
    this.type,
    this.account,
    this.title,
    this.firstName,
    this.lastName,
    this.status,
    this.parentUserId,
    this.zaloId,
    this.staffId,
  });

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) {
    return _$UserInfoResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserInfoResponseToJson(this);
}
