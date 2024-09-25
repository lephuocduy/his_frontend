import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:his_frontend/api/services/setting/models/response/benefit_item_response/benefit_item_response.dart';
import 'package:his_frontend/api/services/setting/models/response/city_item_response/city_item_response.dart';
import 'package:his_frontend/api/services/setting/models/response/clinic_item_response.dart/clinic_item_response.dart';
import 'package:his_frontend/api/services/setting/models/response/district_item_response/district_item_response.dart';
import 'package:his_frontend/api/services/setting/models/response/ethnic_item_response/ethnic_item_response.dart';
import 'package:his_frontend/api/services/setting/models/response/job_item_response/job_item_response.dart';
import 'package:his_frontend/api/services/setting/models/response/medical_examination_service_item_response/medical_examination_service_item_response.dart';
import 'package:his_frontend/api/services/setting/models/response/nation_item_response/nation_item_response.dart';
import 'package:his_frontend/api/services/setting/models/response/relationship_item_response/relationship_item_response.dart';
import 'package:his_frontend/api/services/setting/models/response/ward_item_response/ward_item_response.dart';
import 'package:his_frontend/api/services/setting/models/response/work_unit_item_response/work_unit_item_response.dart';

part 'item_base_model.g.dart';

@CopyWith()
class ItemBaseModel {
  final int? id;
  final String? code;
  final String? name;

  ItemBaseModel({
    this.id,
    this.code,
    this.name,
  });

  factory ItemBaseModel.fromApiNationModel(NationItemResponse data) {
    return ItemBaseModel(
      code: data.code,
      name: data.name,
    );
  }

  factory ItemBaseModel.fromApiEthnicModel(EthnicItemResponse data) {
    return ItemBaseModel(
      code: data.code,
      name: data.name,
    );
  }

  factory ItemBaseModel.fromApiJobModel(JobItemResponse data) {
    return ItemBaseModel(
      id: data.code,
      name: data.description,
    );
  }

  factory ItemBaseModel.fromApiCityModel(CityItemResponse data) {
    return ItemBaseModel(
      code: data.code,
      name: data.name,
    );
  }

  factory ItemBaseModel.fromApiDistrictModel(DistrictItemResponse data) {
    return ItemBaseModel(
      code: data.code,
      name: data.name,
    );
  }

  factory ItemBaseModel.fromApiWardModel(WardItemResponse data) {
    return ItemBaseModel(
      code: data.code,
      name: data.name,
    );
  }

  factory ItemBaseModel.fromApiWorkUnitModel(WorkUnitItemResponse data) {
    return ItemBaseModel(
      code: data.code,
      name: data.name,
    );
  }

  factory ItemBaseModel.fromApiRelationshipModel(
      RelationshipItemResponse data) {
    return ItemBaseModel(
      id: data.code,
      name: data.description,
    );
  }

  factory ItemBaseModel.fromApiBenefitModel(BenefitItemResponse data) {
    return ItemBaseModel(
      id: data.code,
      name: data.description,
    );
  }

  factory ItemBaseModel.fromApiClinicModel(ClinicItemResponse data) {
    return ItemBaseModel(
      code: data.code,
      name: data.name,
    );
  }

  factory ItemBaseModel.fromApiMedicalExaminationServiceModel(
      MedicalExaminationServiceItemResponse data) {
    return ItemBaseModel(
      code: data.code,
      name: data.description,
    );
  }
}
