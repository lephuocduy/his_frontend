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
    // return response.map((e) => ItemBaseModel.fromApiMedicalExaminationServiceModel(e)).toList();
    return [
      ItemBaseModel(
          code: 'xnhh450', name: 'Đếm số lượng tế bào gốc (stem cell, CD34)'),
      ItemBaseModel(
          code: 'xnhh469',
          name: 'Định danh kháng thể kháng HLA bằng kỹ thuật ELISA'),
      ItemBaseModel(
          code: 'xnhh468',
          name: 'Định danh kháng thể kháng HLA bằng kỹ thuật luminex'),
      ItemBaseModel(code: 'xnhh427', name: 'Định lượng Acid Folic'),
      ItemBaseModel(code: 'xnhh50', name: 'Định lượng Anti Xa'),
      ItemBaseModel(
          code: 'xnhh400',
          name: 'Định lượng AT/AT III (Anti thrombin/ Anti thrombinIII)'),
      ItemBaseModel(code: 'xnhh428', name: 'Định lượng Beta 2 Microglobulin'),
      ItemBaseModel(
          code: 'xnhh423',
          name:
              'Định lượng chất ức chế hoạt hóa Plasmin (PAI: Plasmin Activated Inhibitor)'),
      ItemBaseModel(
          code: 'xnhh457',
          name: 'Định lượng chất ức chế hoạt hóa Plasmin 1 (PAI-1)'),
      ItemBaseModel(
          code: 'xnhh458',
          name: 'Định lượng chất ức chế hoạt hóa Plasmin 2 (PAI-2)'),
      ItemBaseModel(code: 'xnhh429', name: 'Định lượng Cyclosporin A'),
      ItemBaseModel(
          code: 'xnhh459',
          name: 'Định lượng D-Dimer bằng kỹ thuật miễn dịch hóa phát quang'),
      ItemBaseModel(code: 'xnhh435', name: 'Định lượng EPO (Erythropoietin)'),
    ];
  }
}
