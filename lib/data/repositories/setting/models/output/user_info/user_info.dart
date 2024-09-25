import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:his_frontend/api/services/setting/models/response/user_info_response/user_info_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
@CopyWith()
class UserInfo {
  String? token;
  String? apiRole;
  int? userId;
  int? type;
  String? account;
  String? firstName;
  String? lastName;
  int? status;
  int? parentUserId;
  int? staffId;

  UserInfo({
    this.token,
    this.apiRole,
    this.userId,
    this.type,
    this.account,
    this.firstName,
    this.lastName,
    this.status,
    this.parentUserId,
    this.staffId,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return _$UserInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

  factory UserInfo.fromApiModel(UserInfoResponse data) {
    return UserInfo(
      token: data.token,
      apiRole: data.apiRole,
      userId: data.userId,
      type: data.type,
      account: data.account,
      firstName: data.firstName,
      lastName: data.lastName,
      status: data.status,
      parentUserId: data.parentUserId,
      staffId: data.staffId,
    );
  }
}
