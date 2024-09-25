import 'package:his_frontend/api/api_endpoints.dart';
import 'package:his_frontend/api/api_service_83.dart';

import 'models/request/create_patient_request/create_patient_request.dart';
import 'models/request/create_visit_request/create_visit_request.dart';
import 'models/response/create_patient_response/create_patient_response.dart';

class ReceptionService {
  final _apiService83 = ApiService83();

  Future<CreatePatientResponse?> createPatient(
    CreatePatientRequest request,
  ) async {
    try {
      final response =
          await _apiService83.post(ReceptionApi.patient, request.toJson());
      if (response != null && response.data != null) {
        return CreatePatientResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  Future<bool> createVisit({
    required CreateVisitRequest request,
    required String visitOn,
  }) async {
    try {
      final response =
          await _apiService83.post(ReceptionApi.visit, request.toJson());
      if (response != null && response.data != null) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
}
