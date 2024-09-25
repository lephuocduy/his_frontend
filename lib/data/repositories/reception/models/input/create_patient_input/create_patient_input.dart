class CreatePatientInput {
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

  CreatePatientInput({
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
}
