import 'package:json_annotation/json_annotation.dart';

part 'clinic_item_response.g.dart';

@JsonSerializable()
class ClinicItemResponse {
  int? unitId;
  int? wardId;
  String? code;
  String? name;
  int? zone;
  int? status;
  int? specialty;
  dynamic tmlId;
  dynamic queueId;
  int? type;
  int? attribute;
  dynamic ptLimitted;
  dynamic index;
  String? insWardCode;

  ClinicItemResponse({
    this.unitId,
    this.wardId,
    this.code,
    this.name,
    this.zone,
    this.status,
    this.specialty,
    this.tmlId,
    this.queueId,
    this.type,
    this.attribute,
    this.ptLimitted,
    this.index,
    this.insWardCode,
  });

  factory ClinicItemResponse.fromJson(Map<String, dynamic> json) {
    return _$ClinicItemResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ClinicItemResponseToJson(this);

  static List<ClinicItemResponse> fromJsonArray(
    List<dynamic> jsonArray,
  ) {
    return jsonArray
        .map(
          (dynamic e) => ClinicItemResponse.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }
}
