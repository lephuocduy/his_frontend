import 'package:his_frontend/data/repositories/reception/models/input/create_visit_input/create_visit_input.dart';
import 'package:json_annotation/json_annotation.dart';

import 'entry_request.dart';

part 'create_visit_request.g.dart';

@JsonSerializable()
class CreateVisitRequest {
  int? patientId;
  DateTime? visitOn;
  int? rxTypeIn;
  int? insBenefitType;
  int? receiveType;
  int? rcvState;
  String? ptName;
  int? ptAge;
  int? ptGender;
  DateTime? ptDob;
  String? ptAddress;
  String? ptDistrict;
  String? ptWard;
  String? ptEthnic;
  String? ptNationality;
  int? attribute;
  int? createById;
  DateTime? createOn;
  int? status;
  EntryRequest? entry;

  CreateVisitRequest({
    this.patientId,
    this.visitOn,
    this.rxTypeIn,
    this.insBenefitType,
    this.receiveType,
    this.rcvState,
    this.ptName,
    this.ptAge,
    this.ptGender,
    this.ptDob,
    this.ptAddress,
    this.ptDistrict,
    this.ptWard,
    this.ptEthnic,
    this.ptNationality,
    this.attribute,
    this.createById,
    this.createOn,
    this.status,
    this.entry,
  });

  factory CreateVisitRequest.fromJson(Map<String, dynamic> json) {
    return _$CreateVisitRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateVisitRequestToJson(this);

  factory CreateVisitRequest.toApiModel(CreateVisitInput input) {
    return CreateVisitRequest(
      patientId: input.patientId,
      visitOn: input.visitOn,
      rxTypeIn: input.rxTypeIn,
      insBenefitType: input.insBenefitType,
      receiveType: input.receiveType,
      rcvState: input.rcvState,
      ptName: input.ptName,
      ptAge: input.ptAge,
      ptGender: input.ptGender,
      ptDob: input.ptDob,
      ptAddress: input.ptAddress,
      ptDistrict: input.ptDistrict,
      ptWard: input.ptWard,
      ptEthnic: input.ptEthnic,
      ptNationality: input.ptNationality,
      attribute: input.attribute,
      createById: input.createById,
      createOn: input.createOn,
      status: input.status,
      entry: input.entry != null ? EntryRequest.toApiModel(input.entry!) : null,
    );
  }
}
