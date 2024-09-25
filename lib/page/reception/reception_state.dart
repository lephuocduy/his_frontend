import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:his_frontend/data/repositories/reception/models/output/reception_filter_item.dart';
import 'package:his_frontend/data/repositories/reception/models/output/reception_item.dart';
import 'package:his_frontend/data/repositories/setting/models/output/item_base_model.dart';

part 'reception_state.g.dart';

@CopyWith()
class ReceptionState {
  final bool isLoading;
  final List<ReceptionItem> receptionList;
  final List<ReceptionFilterItem> receptionFilterList;
  final bool isSuccess;
  final bool isSubmit;
  // data dropdown
  final List<ItemBaseModel> nationList;
  final List<ItemBaseModel> ethnicList;
  final List<ItemBaseModel> jobList;
  final List<ItemBaseModel> cityList;
  final List<ItemBaseModel> districtList;
  final List<ItemBaseModel> wardList;
  final List<ItemBaseModel> workUnitList;
  final List<ItemBaseModel> relationshipList;
  final List<ItemBaseModel> benefitList;
  final List<ItemBaseModel> clinicList;
  final List<ItemBaseModel> medicalExaminationServiceList;

  //
  final String? patientCode;
  final String? fullName;
  final DateTime? dob;
  final ItemBaseModel? gender;
  final ItemBaseModel? country;
  final ItemBaseModel? occupation;
  final ItemBaseModel? ethnic;
  final ItemBaseModel? city;
  final ItemBaseModel? district;
  final ItemBaseModel? ward;
  final String? address;
  //
  final DateTime? visitOn;
  final ItemBaseModel? benefit;
  final ItemBaseModel? wardUnit;
  final ItemBaseModel? medService;

  const ReceptionState({
    this.isLoading = false,
    this.receptionList = const [],
    this.receptionFilterList = const [],
    this.nationList = const [],
    this.ethnicList = const [],
    this.jobList = const [],
    this.cityList = const [],
    this.districtList = const [],
    this.wardList = const [],
    this.workUnitList = const [],
    this.relationshipList = const [],
    this.benefitList = const [],
    this.clinicList = const [],
    this.medicalExaminationServiceList = const [],
    this.patientCode,
    this.fullName,
    this.dob,
    this.gender,
    this.country,
    this.occupation,
    this.ethnic,
    this.city,
    this.district,
    this.ward,
    this.address,
    this.isSuccess = false,
    this.isSubmit = false,
    this.benefit,
    this.wardUnit,
    this.medService,
    this.visitOn,
  });

  bool get isValid {
    return visitOn != null;
  }
}
