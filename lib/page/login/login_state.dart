import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:his_frontend/data/repositories/setting/models/output/item_base_model.dart';

import 'models/login_status.dart';

part 'login_state.g.dart';

@CopyWith()
class LoginState {
  final LoginStatus? loginStatus;
  final List<ItemBaseModel>? departmentList;
  final List<ItemBaseModel>? roomList;
  final String? account;
  final String? password;
  final ItemBaseModel? department;
  final ItemBaseModel? room;
  final bool isLoading;
  final String? message;

  const LoginState({
    this.loginStatus = LoginStatus.initial,
    this.departmentList,
    this.roomList,
    this.account,
    this.password,
    this.department,
    this.room,
    this.isLoading = false,
    this.message,
  });
}
