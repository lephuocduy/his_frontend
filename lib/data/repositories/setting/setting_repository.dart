import 'package:flutter/foundation.dart';
import 'package:his_frontend/api/services/setting/models/request/login_request.dart';
import 'package:his_frontend/api/services/setting/setting_service.dart';

import 'models/input/login_input.dart';
import 'models/output/item_base_model.dart';
import 'models/output/user_info/user_info.dart';

class SettingRepository {
  final _service = SettingService();

  Future<UserInfo?> login(LoginInput input) async {
    try {
      final response = await _service.login(LoginRequest.toApiModel(input));
      if (response == null) {
        return null;
      }
      final result = UserInfo.fromApiModel(response);
      return result;
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
      return null;
    }
  }

  Future<List<ItemBaseModel>> getNation() async {
    final response = await _service.getNation();
    return response.map((e) => ItemBaseModel.fromApiNationModel(e)).toList();
  }

  Future<List<ItemBaseModel>> getEthnic() async {
    final response = await _service.getEthnic();
    return response.map((e) => ItemBaseModel.fromApiEthnicModel(e)).toList();
  }

  Future<List<ItemBaseModel>> getJob() async {
    final response = await _service.getJob();
    return response.map((e) => ItemBaseModel.fromApiJobModel(e)).toList();
  }

  Future<List<ItemBaseModel>> getCity() async {
    final response = await _service.getCity();
    return response.map((e) => ItemBaseModel.fromApiCityModel(e)).toList();
  }

  Future<List<ItemBaseModel>> getDistrict(String cityCode) async {
    final response = await _service.getDistrict(cityCode);
    return response.map((e) => ItemBaseModel.fromApiDistrictModel(e)).toList();
  }

  Future<List<ItemBaseModel>> getWard(String districtCode) async {
    final response = await _service.getWard(districtCode);
    return response.map((e) => ItemBaseModel.fromApiWardModel(e)).toList();
  }

  Future<List<ItemBaseModel>> getWorkUnit() async {
    final response = await _service.getWorkUnit();
    return response.map((e) => ItemBaseModel.fromApiWorkUnitModel(e)).toList();
  }

  Future<List<ItemBaseModel>> getRelationship() async {
    final response = await _service.getRelationship();
    return response
        .map((e) => ItemBaseModel.fromApiRelationshipModel(e))
        .toList();
  }

  Future<List<ItemBaseModel>> getBenefit() async {
    final response = await _service.getBenefit();
    return response.map((e) => ItemBaseModel.fromApiBenefitModel(e)).toList();
  }

  Future<List<ItemBaseModel>> getClinic() async {
    final response = await _service.getClinic();
    return response.map((e) => ItemBaseModel.fromApiClinicModel(e)).toList();
  }

  Future<List<ItemBaseModel>> getMedicalExaminationService() async {
    // final response = await _service.getMedicalExaminationService();
    // return response
    //     .map((e) => ItemBaseModel.fromApiMedicalExaminationServiceModel(e))
    //     .toList();
    return [
      ItemBaseModel(code: "KCC1", name: "Khám Nội [Cấp Cứu]"),
      ItemBaseModel(code: "KCC01", name: "Khám Cấp Cứu (lần 2)"),
      ItemBaseModel(code: "kdl", name: "Khám Da Liễu"),
      ItemBaseModel(code: "KDLNTK01", name: "Khám Da Liễu (lần 2)"),
      ItemBaseModel(code: "KDD1", name: "Khám Dinh Dưỡng"),
      ItemBaseModel(code: "KDD03", name: "Khám Dinh Dưỡng ( lần 2)"),
      ItemBaseModel(code: "KDY2", name: "Khám YHCT"),
      ItemBaseModel(code: "KDY01", name: "Khám Đông Y (lần 2)"),
      ItemBaseModel(code: "khh", name: "Khám Hô Hấp"),
      ItemBaseModel(code: "KHOHAP01", name: "Khám Hô Hấp (lần 2)"),
      ItemBaseModel(code: "KLCK", name: "Khám Liên Chuyên Khoa"),
      ItemBaseModel(code: "KMAT2", name: "Khám Mắt"),
      ItemBaseModel(code: "KMAT01", name: "Khám Mắt (lân 2)"),
      ItemBaseModel(code: "KHH1", name: "Khám Hô Hấp (Lần 1)"),
      ItemBaseModel(code: "KHN1", name: "Khám Nội (Lần 1)"),
      ItemBaseModel(code: "KDK1", name: "Khám Dinh Dưỡng (Lần 1)"),
      ItemBaseModel(code: "KDL01", name: "Khám Da Liễu (Lần 1)"),
      ItemBaseModel(code: "KMT1", name: "Khám Mắt (Lần 1)"),
      ItemBaseModel(code: "KMT2", name: "Khám Mắt (Lần 3)"),
      ItemBaseModel(code: "KHH2", name: "Khám Hô Hấp (Lần 2)"),
      ItemBaseModel(code: "KYN1", name: "Khám YHCT (Lần 1)"),
      ItemBaseModel(code: "KYN2", name: "Khám YHCT (Lần 2)"),
      ItemBaseModel(code: "KDC1", name: "Khám Dinh Dưỡng (Lần 3)"),
      ItemBaseModel(code: "KDN1", name: "Khám Đông Y (Lần 1)"),
      ItemBaseModel(code: "KDK2", name: "Khám Dinh Dưỡng (Lần 4)"),
      ItemBaseModel(code: "KHT1", name: "Khám Hô Hấp (Lần 3)"),
      ItemBaseModel(code: "KHT2", name: "Khám Hô Hấp (Lần 4)"),
      ItemBaseModel(code: "KDN2", name: "Khám Đông Y (Lần 2)"),
      ItemBaseModel(code: "KMT3", name: "Khám Mắt (Lần 4)"),
      ItemBaseModel(code: "KMT4", name: "Khám Mắt (Lần 5)"),
      ItemBaseModel(code: "KHD1", name: "Khám Hệ Thống (Lần 1)"),
      ItemBaseModel(code: "KHD2", name: "Khám Hệ Thống (Lần 2)"),
      ItemBaseModel(code: "KHT3", name: "Khám Hô Hấp (Lần 5)"),
      ItemBaseModel(code: "KHN2", name: "Khám Nội (Lần 2)"),
      ItemBaseModel(code: "KHN3", name: "Khám Nội (Lần 3)"),
      ItemBaseModel(code: "KTH1", name: "Khám Tâm Huyết (Lần 1)"),
      ItemBaseModel(code: "KTH2", name: "Khám Tâm Huyết (Lần 2)"),
      ItemBaseModel(code: "KTH3", name: "Khám Tâm Huyết (Lần 3)"),
    ];
  }
}
