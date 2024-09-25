import 'package:his_frontend/data/repositories/setting/models/input/login_input.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  String? account;
  String? pwd;

  LoginRequest({this.account, this.pwd});

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return _$LoginRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  factory LoginRequest.toApiModel(LoginInput input) {
    return LoginRequest(
      account: input.account,
      pwd: input.password,
    );
  }
}
