import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:his_frontend/data/repositories/setting/models/output/item_base_model.dart';

import 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(const LoginState());

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
}
