import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:his_frontend/data/local/preferences.dart';
import 'package:his_frontend/data/repositories/setting/models/input/login_input.dart';
import 'package:his_frontend/data/repositories/setting/models/output/item_base_model.dart';
import 'package:his_frontend/data/repositories/setting/setting_repository.dart';
import 'package:his_frontend/page/login/models/login_status.dart';

import 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(const LoginState());
  final _settingRepository = SettingRepository();

  onStart() async {
    emit(state.copyWith(
      isLoading: true,
    ));
    try {
      final departmentList = <ItemBaseModel>[
        ItemBaseModel(id: 1, name: 'Khoa cấp cứu'),
        ItemBaseModel(id: 2, name: 'Khoa nội'),
        ItemBaseModel(id: 3, name: 'Khoa ngoại'),
      ];

      final roomList = [
        ItemBaseModel(id: 1, name: 'Phòng 1'),
        ItemBaseModel(id: 2, name: 'Phòng 2'),
        ItemBaseModel(id: 3, name: 'Phòng 3'),
      ];

      emit(state.copyWith(
        departmentList: departmentList,
        roomList: roomList,
      ));
    } catch (e) {
      log(e.toString());
    } finally {
      emit(state.copyWith(
        isLoading: false,
      ));
    }
  }

  onChangeAccount(String? value) {
    emit(state.copyWith(
      account: value,
    ));
  }

  onChangePassword(String? value) {
    emit(state.copyWith(
      password: value,
    ));
  }

  onLogin() async {
    emit(state.copyWith(
      isLoading: true,
    ));

    try {
      final data = await _settingRepository.login(LoginInput(
        account: state.account,
        password: 'c4ca4238a0b923820dcc509a6f75849b',
      ));

      if (data != null) {
        Preference.setUserInfo(data);
        emit(state.copyWith(
          loginStatus: LoginStatus.loginSuccess,
        ));
      } else {
        emit(state.copyWith(
          loginStatus: LoginStatus.loginFailure,
        ));
      }
    } catch (e) {
      log(e.toString());
    } finally {
      emit(state.copyWith(
        isLoading: false,
      ));
    }
  }
}
