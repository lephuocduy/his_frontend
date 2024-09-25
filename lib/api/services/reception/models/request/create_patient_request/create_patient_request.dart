import 'package:his_frontend/data/repositories/reception/models/input/create_patient_input/create_patient_input.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_patient_request.g.dart';

@JsonSerializable()
class CreatePatientRequest {
  String? patientCode;
  String? firstName;
  String? lastName;
  DateTime? dob;
  int? gender;
  String? country;
  String? nationality;
  int? occupation;
  String? ethnic;
  String? city;
  String? district;
  String? ward;
  String? address;
  int? status;

  CreatePatientRequest({
    this.patientCode,
    this.firstName,
    this.lastName,
    this.dob,
    this.gender,
    this.country,
    this.nationality,
    this.occupation,
    this.ethnic,
    this.city,
    this.district,
    this.ward,
    this.address,
    this.status,
  });

  factory CreatePatientRequest.fromJson(Map<String, dynamic> json) {
    return _$CreatePatientRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreatePatientRequestToJson(this);

  factory CreatePatientRequest.toApiModel(CreatePatientInput input) {
    return CreatePatientRequest(
      patientCode: input.patientCode,
      firstName: input.firstName,
      lastName: input.lastName,
      dob: input.dob,
      gender: input.gender,
      country: input.country,
      nationality: input.nationality,
      occupation: input.occupation,
      ethnic: input.ethnic,
      city: input.city,
      district: input.district,
      ward: input.ward,
      address: input.address,
      status: input.status,
    );
  }
}
