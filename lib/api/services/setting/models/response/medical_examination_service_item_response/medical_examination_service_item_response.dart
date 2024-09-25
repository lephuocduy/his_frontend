import 'package:json_annotation/json_annotation.dart';

part 'medical_examination_service_item_response.g.dart';

@JsonSerializable()
class MedicalExaminationServiceItemResponse {
  int? serviceId;
  String? code;
  String? description;

  MedicalExaminationServiceItemResponse({
    this.serviceId,
    this.code,
    this.description,
  });

  factory MedicalExaminationServiceItemResponse.fromJson(
      Map<String, dynamic> json) {
    return _$MedicalExaminationServiceItemResponseFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$MedicalExaminationServiceItemResponseToJson(this);

  static List<MedicalExaminationServiceItemResponse> fromJsonArray(
    List<dynamic> jsonArray,
  ) {
    return jsonArray
        .map(
          (dynamic e) => MedicalExaminationServiceItemResponse.fromJson(
              e as Map<String, dynamic>),
        )
        .toList();
  }
}
