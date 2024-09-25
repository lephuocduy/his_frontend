import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'info_patient_state.dart';

class InfoReceptionBloc extends Cubit<InfoReceptionState> {
  InfoReceptionBloc() : super(const InfoReceptionState());

  onStart() async {
    emit(state.copyWith(
      isLoading: true,
    ));
    try {
      emit(state.copyWith());
    } catch (e) {
      log(e.toString());
    } finally {
      emit(state.copyWith(
        isLoading: false,
      ));
    }
  }
}
