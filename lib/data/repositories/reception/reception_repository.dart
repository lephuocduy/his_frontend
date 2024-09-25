import 'package:flutter/foundation.dart';
import 'package:his_frontend/api/services/reception/models/request/create_patient_request/create_patient_request.dart';
import 'package:his_frontend/api/services/reception/models/request/create_visit_request/create_visit_request.dart';
import 'package:his_frontend/api/services/reception/reception_service.dart';

import 'models/input/create_patient_input/create_patient_input.dart';
import 'models/input/create_visit_input/create_visit_input.dart';
import 'models/output/create_patient.dart';

class ReceptionRepository {
  final _service = ReceptionService();

  Future<CreatePatient?> createPatient(CreatePatientInput input) async {
    try {
      final response =
          await _service.createPatient(CreatePatientRequest.toApiModel(input));
      if (response == null) {
        return null;
      }
      final result = CreatePatient.fromApiModel(response);
      return result;
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
      return null;
    }
  }

  Future<bool> createVisit({
    required CreateVisitInput input,
    required String visitOn,
  }) async {
    try {
      final response = await _service.createVisit(
        request: CreateVisitRequest.toApiModel(input),
        visitOn: visitOn,
      );
      if (response == false) {
        return false;
      }
      return true;
    } catch (error, stackTrace) {
      if (kDebugMode) {
        print("$error + $stackTrace");
      }
      return false;
    }
  }
}
