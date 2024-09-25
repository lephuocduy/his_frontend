import 'package:json_annotation/json_annotation.dart';

part 'create_patient_response.g.dart';

@JsonSerializable()
class CreatePatientResponse {
  int? patientId;
  String? patientCode;
  String? firstName;
  String? lastName;
  String? srcFullName;
  DateTime? dob;
  dynamic title;
  int? gender;
  dynamic bloodType;
  dynamic idCardNo;
  dynamic email;
  dynamic mobileNo;
  dynamic homePhone;
  dynamic workPhone;
  String? nationality;
  String? ethnic;
  String? country;
  String? city;
  String? district;
  String? ward;
  String? address;
  int? occupation;
  dynamic employerName;
  dynamic employerAddr;
  dynamic taxCode;
  dynamic relativeName;
  dynamic relativeAddr;
  dynamic relativePhone;
  dynamic relativeType;
  dynamic notes;
  dynamic medHistPerson;
  dynamic medHistFamily;
  int? status;
  dynamic clientId;
  dynamic hid;
  dynamic sysCode;
  dynamic attribute;
  dynamic mergePatientId;
  dynamic idCardOn;
  dynamic idCardAt;
  dynamic ehrId;
  dynamic ehrUserName;
  dynamic ehrCreateOn;
  dynamic ehrCreateById;
  dynamic bloodDonationCard;
  dynamic bloodDonationCount;
  dynamic objExam130;

  CreatePatientResponse({
    this.patientId,
    this.patientCode,
    this.firstName,
    this.lastName,
    this.srcFullName,
    this.dob,
    this.title,
    this.gender,
    this.bloodType,
    this.idCardNo,
    this.email,
    this.mobileNo,
    this.homePhone,
    this.workPhone,
    this.nationality,
    this.ethnic,
    this.country,
    this.city,
    this.district,
    this.ward,
    this.address,
    this.occupation,
    this.employerName,
    this.employerAddr,
    this.taxCode,
    this.relativeName,
    this.relativeAddr,
    this.relativePhone,
    this.relativeType,
    this.notes,
    this.medHistPerson,
    this.medHistFamily,
    this.status,
    this.clientId,
    this.hid,
    this.sysCode,
    this.attribute,
    this.mergePatientId,
    this.idCardOn,
    this.idCardAt,
    this.ehrId,
    this.ehrUserName,
    this.ehrCreateOn,
    this.ehrCreateById,
    this.bloodDonationCard,
    this.bloodDonationCount,
    this.objExam130,
  });

  factory CreatePatientResponse.fromJson(Map<String, dynamic> json) {
    return _$CreatePatientResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreatePatientResponseToJson(this);
}
