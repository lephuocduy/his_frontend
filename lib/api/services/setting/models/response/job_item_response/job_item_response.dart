import 'package:json_annotation/json_annotation.dart';

part 'job_item_response.g.dart';

@JsonSerializable()
class JobItemResponse {
  int? type;
  dynamic parentCode;
  dynamic govtCode;
  int? attribute;
  dynamic descriptionL1;
  int? status;
  dynamic abbr;
  dynamic code130;
  dynamic parentCode130;
  dynamic level;
  dynamic onDate;
  dynamic value;
  int? code;
  String? description;

  JobItemResponse({
    this.type,
    this.parentCode,
    this.govtCode,
    this.attribute,
    this.descriptionL1,
    this.status,
    this.abbr,
    this.code130,
    this.parentCode130,
    this.level,
    this.onDate,
    this.value,
    this.code,
    this.description,
  });

  factory JobItemResponse.fromJson(Map<String, dynamic> json) {
    return _$JobItemResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$JobItemResponseToJson(this);

  static List<JobItemResponse> fromJsonArray(
    List<dynamic> jsonArray,
  ) {
    return jsonArray
        .map(
          (dynamic e) => JobItemResponse.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }
}
