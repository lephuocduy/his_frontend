class SettingApi {
  // Quốc gia
  static const nation = "/AuCountries";
  // Dân tộc
  static const ethnic = "/Ethnics";
  // Nghề nghiệp
  static const job = "/Occupations";
  // Thành phố
  static const city = "/AuCities";
  // Quận
  static const district = "/AuDistricts/City/{code}";
  // Phường
  static const ward = "/AuWards/District/{code}";
  // Đơn vị công tác
  static const workUnit = "/Companies";
  // Mối quan hệ
  static const relationship = "/RelativeTypes";
  // Quyền lợi
  static const benefit = "/InsBenefitTypes";
  // Phòng khám
  static const clinic = "/WardUnits";
  // Dịch vụ khám
  static const medicalExaminationService = "/MedServices";
}

class ReceptionApi {
  static const patient = "/Patients";
  static const visit = "/Visits?visitOn={visitOn}";
}
