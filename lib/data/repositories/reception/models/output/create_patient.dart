import 'package:his_frontend/api/services/reception/models/response/create_patient_response/create_patient_response.dart';

class CreatePatient {
  int? patientId;
  String? patientCode;
  String? firstName;
  String? lastName;
  String? srcFullName;
  DateTime? dob;
  int? gender;
  String? nationality;
  String? ethnic;
  String? country;
  String? city;
  String? district;
  String? ward;
  String? address;
  int? occupation;
  int? status;

  CreatePatient({
    this.patientId,
    this.patientCode,
    this.firstName,
    this.lastName,
    this.srcFullName,
    this.dob,
    this.gender,
    this.nationality,
    this.ethnic,
    this.country,
    this.city,
    this.district,
    this.ward,
    this.address,
    this.occupation,
    this.status,
  });

  factory CreatePatient.fromApiModel(
      CreatePatientResponse data) {
    return CreatePatient(
      patientId: data.patientId,
      patientCode: data.patientCode,
      firstName: data.firstName,
      lastName: data.lastName,
      srcFullName: data.srcFullName,
      dob: data.dob,
      gender: data.gender,
      nationality: data.nationality,
      ethnic: data.ethnic,
    );
  }
}
