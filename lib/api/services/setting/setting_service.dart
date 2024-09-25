import 'package:dio/dio.dart';
import 'package:his_frontend/api/api_endpoints.dart';
import 'package:his_frontend/api/api_service_82.dart';

import 'models/request/login_request.dart';
import 'models/response/benefit_item_response/benefit_item_response.dart';
import 'models/response/city_item_response/city_item_response.dart';
import 'models/response/clinic_item_response.dart/clinic_item_response.dart';
import 'models/response/district_item_response/district_item_response.dart';
import 'models/response/ethnic_item_response/ethnic_item_response.dart';
import 'models/response/job_item_response/job_item_response.dart';
import 'models/response/medical_examination_service_item_response/medical_examination_service_item_response.dart';
import 'models/response/nation_item_response/nation_item_response.dart';
import 'models/response/relationship_item_response/relationship_item_response.dart';
import 'models/response/user_info_response/user_info_response.dart';
import 'models/response/ward_item_response/ward_item_response.dart';
import 'models/response/work_unit_item_response/work_unit_item_response.dart';

class SettingService {
  final _apiService82 = ApiService82();
  final _dio = Dio();

  Future<UserInfoResponse?> login(LoginRequest request) async {
    try {
      final response = await _dio.get(
        'http://192.168.110.16:1081/Users/Login/${request.account}?pwd=${request.pwd}',
      );
      return UserInfoResponse.fromJson(response.data);
    } catch (error) {
      return null;
    }
  }

  Future<List<NationItemResponse>> getNation() async {
    try {
      final response = await _apiService82.get(SettingApi.nation);
      if (response != null && response.data != null) {
        return NationItemResponse.fromJsonArray(response.data);
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<List<EthnicItemResponse>> getEthnic() async {
    try {
      final response = await _apiService82.get(SettingApi.ethnic);
      if (response != null && response.data != null) {
        return EthnicItemResponse.fromJsonArray(response.data);
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<List<JobItemResponse>> getJob() async {
    try {
      final response = await _apiService82.get(SettingApi.job);
      if (response != null && response.data != null) {
        return JobItemResponse.fromJsonArray(response.data);
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<List<CityItemResponse>> getCity() async {
    try {
      final response = await _apiService82.get(SettingApi.city);
      if (response != null && response.data != null) {
        return CityItemResponse.fromJsonArray(response.data);
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<List<DistrictItemResponse>> getDistrict(String cityCode) async {
    try {
      final response = await _apiService82
          .get(SettingApi.district.replaceAll('{code}', cityCode));
      if (response != null && response.data != null) {
        return DistrictItemResponse.fromJsonArray(response.data);
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<List<WardItemResponse>> getWard(String districtCode) async {
    try {
      final response = await _apiService82
          .get(SettingApi.ward.replaceAll('{code}', districtCode));
      if (response != null && response.data != null) {
        return WardItemResponse.fromJsonArray(response.data);
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<List<WorkUnitItemResponse>> getWorkUnit() async {
    try {
      final response = await _apiService82.get(SettingApi.workUnit);
      if (response != null && response.data != null) {
        return WorkUnitItemResponse.fromJsonArray(response.data);
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<List<RelationshipItemResponse>> getRelationship() async {
    try {
      final response = await _apiService82.get(SettingApi.relationship);
      if (response != null && response.data != null) {
        return RelationshipItemResponse.fromJsonArray(response.data);
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<List<BenefitItemResponse>> getBenefit() async {
    try {
      final response = await _apiService82.get(SettingApi.benefit);
      if (response != null && response.data != null) {
        return BenefitItemResponse.fromJsonArray(response.data);
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<List<ClinicItemResponse>> getClinic() async {
    try {
      final response = await _apiService82.get(SettingApi.clinic);
      if (response != null && response.data != null) {
        return ClinicItemResponse.fromJsonArray(response.data);
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<List<MedicalExaminationServiceItemResponse>>
      getMedicalExaminationService() async {
    try {
      final response =
          await _apiService82.get(SettingApi.medicalExaminationService);
      if (response != null && response.data != null) {
        return MedicalExaminationServiceItemResponse.fromJsonArray(
            response.data);
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }
}
