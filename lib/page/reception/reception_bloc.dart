import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:his_frontend/core/utils/date_time.dart';
import 'package:his_frontend/data/repositories/reception/models/input/create_patient_input/create_patient_input.dart';
import 'package:his_frontend/data/repositories/reception/models/input/create_visit_input/create_visit_input.dart';
import 'package:his_frontend/data/repositories/reception/models/input/create_visit_input/entry_input.dart';
import 'package:his_frontend/data/repositories/reception/models/output/reception_filter_item.dart';
import 'package:his_frontend/data/repositories/reception/models/output/reception_item.dart';
import 'package:his_frontend/data/repositories/reception/reception_repository.dart';
import 'package:his_frontend/data/repositories/setting/models/output/item_base_model.dart';
import 'package:his_frontend/data/repositories/setting/setting_repository.dart';

import 'reception_state.dart';

class ReceptionBloc extends Cubit<ReceptionState> {
  ReceptionBloc() : super(const ReceptionState());
  final _settingRepository = SettingRepository();
  final _receptionRepository = ReceptionRepository();

  Map<int, String?> getFirstAndLastName() {
    if ((state.fullName ?? '').isEmpty) {
      return {0: null, 1: null};
    }
    // Split the full name by spaces
    List<String> nameParts = state.fullName!.trim().split(' ');

    // Extract the first name (last part) and last name (all before first name)
    String? firstName = nameParts.isNotEmpty ? nameParts.last : null;
    String? lastName = nameParts.length > 1
        ? nameParts.sublist(0, nameParts.length - 1).join(' ')
        : null;

    return {0: firstName, 1: lastName};
  }

  onStart() async {
    emit(state.copyWith(
      isLoading: true,
    ));
    try {
      final receptionList = <ReceptionItem>[
        ReceptionItem(
          id: '1',
          code: '111111',
          examinationDate: DateTime.now(),
          clinic: 'Khoa cấp cứu',
          service: 'Dịch vụ 1',
          healthInsuranceCode: '111111',
          staff: 'Nhân viên 1',
          examinationDoctor: 'Bác sĩ 1',
        ),
        ReceptionItem(
          id: '2',
          code: '222222',
          examinationDate: DateTime.now(),
          clinic: 'Khoa cấp cứu',
          service: 'Dịch vụ 2',
          healthInsuranceCode: '222222',
          staff: 'Nhân viên 2',
          examinationDoctor: 'Bác sĩ 2',
        ),
      ];

      final receptionFilterList = <ReceptionFilterItem>[
        ReceptionFilterItem(
          id: '1',
          clinic: 'Khoa cấp cứu',
          total: '1',
          healthInsuranceCode: '111111',
          examined: true,
        ),
        ReceptionFilterItem(
          id: '2',
          clinic: 'Khoa cấp cứu',
          total: '2',
          healthInsuranceCode: '222222',
          examined: false,
        ),
      ];

      var value = await Future.wait([
        _settingRepository.getNation(),
        _settingRepository.getEthnic(),
        _settingRepository.getJob(),
        _settingRepository.getCity(),
        _settingRepository.getWorkUnit(),
        _settingRepository.getRelationship(),
        _settingRepository.getBenefit(),
        _settingRepository.getClinic(),
        _settingRepository.getMedicalExaminationService(),
      ]);

      final nationList = value[0];
      final ethnicList = value[1];
      final jobList = value[2];
      final cityList = value[3];
      final workUnitList = value[4];
      final relationshipList = value[5];
      final benefitList = value[6];
      final clinicList = value[7];
      final medicalExaminationServiceList = value[8];

      emit(state.copyWith(
        receptionList: receptionList,
        receptionFilterList: receptionFilterList,
        //
        nationList: nationList,
        ethnicList: ethnicList,
        jobList: jobList,
        cityList: cityList,
        workUnitList: workUnitList,
        relationshipList: relationshipList,
        benefitList: benefitList,
        clinicList: clinicList,
        medicalExaminationServiceList: medicalExaminationServiceList,
        //
        benefit: benefitList.first,
      ));
    } catch (e) {
      log(e.toString());
    } finally {
      emit(state.copyWith(
        isLoading: false,
      ));
    }
  }

  onClear() {
    emit(state.copyWith(
      isLoading: false,
    ));
  }

  onSave() async {
    emit(state.copyWith(
      isLoading: true,
      isSuccess: false,
      isSubmit: false,
    ));
    try {
      final nameData = getFirstAndLastName();
      _receptionRepository
          .createPatient(
        CreatePatientInput(
          patientCode: state.patientCode,
          firstName: nameData[0],
          lastName: nameData[1],
          dob: state.dob,
          gender: state.gender?.id,
          country: state.country?.code,
          nationality: state.country?.code,
          occupation: 1,
          ethnic: state.ethnic?.code,
          city: state.city?.code,
          district: state.district?.code,
          ward: state.ward?.code,
          address: state.address,
          status: 1,
        ),
      )
          .then((value) async {
        if (value != null && state.visitOn != null) {
          final data = await _receptionRepository.createVisit(
            visitOn: state.visitOn!.format(pattern: yyyyMMddHHmmss),
            input: CreateVisitInput(
              patientId: value.patientId,
              rxTypeIn: 0,
              insBenefitType: 1,
              receiveType: 1,
              rcvState: 1,
              ptName: '',
              ptAge: 18,
              ptGender: 1,
              ptDob: DateTime.now(),
              ptAddress: state.city?.code,
              ptDistrict: state.district?.code,
              ptWard: state.ward?.code,
              ptEthnic: state.ethnic?.code,
              ptNationality: state.country?.code,
              attribute: 0,
              createById: 3834,
              createOn: DateTime.now(),
              status: 1,
              entry: EntryInput(
                wardUnitId: 149,
                medServiceId: 4803,
                priceId: 0,
                insBenefitType: 0,
                insBenefitRatio: 0,
                createById: 3834,
                status: 1,
                onDate: DateTime.now(),
              ),
            ),
          );

          emit(state.copyWith(
            isSuccess: data,
            isSubmit: true,
          ));
        }
      });
    } catch (e) {
      log(e.toString());
    } finally {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: false,
        isSubmit: false,
      ));
    }
  }

  onChangeData({
    String? patientCode,
    String? fullname,
    DateTime? dob,
    ItemBaseModel? gender,
    ItemBaseModel? country,
    ItemBaseModel? occupation,
    ItemBaseModel? ethnic,
    ItemBaseModel? city,
    ItemBaseModel? district,
    ItemBaseModel? ward,
    String? address,
    DateTime? visitOn,
    ItemBaseModel? benefit,
    ItemBaseModel? wardUnit,
    ItemBaseModel? medService,
  }) async {
    var districtList = state.districtList;
    var districtChange = district ?? state.district;
    var wardList = state.wardList;
    var wardChange = ward ?? state.ward;
    if (city != null && city != state.city) {
      districtList = await _settingRepository.getDistrict(city.code ?? '01');
      districtChange = null;
      wardList = [];
      wardChange = null;
    }
    if (district != null && district != state.district) {
      wardList = await _settingRepository.getWard(district.code ?? '001');
      wardChange = null;
    }
    emit(state.copyWith(
      districtList: districtList,
      wardList: wardList,
      patientCode: patientCode ?? state.patientCode,
      fullName: fullname ?? state.fullName,
      dob: dob ?? state.dob,
      gender: gender ?? state.gender,
      country: country ?? state.country,
      occupation: occupation ?? state.occupation,
      ethnic: ethnic ?? state.ethnic,
      city: city ?? state.city,
      district: districtChange,
      ward: wardChange,
      address: address ?? state.address,
      visitOn: visitOn ?? state.visitOn,
      benefit: benefit ?? state.benefit,
      wardUnit: wardUnit ?? state.wardUnit,
      medService: medService ?? state.medService,
    ));
  }
}
