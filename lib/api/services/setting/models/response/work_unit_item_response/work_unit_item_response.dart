import 'package:json_annotation/json_annotation.dart';

part 'work_unit_item_response.g.dart';

@JsonSerializable()
class WorkUnitItemResponse {
  String? code;
  String? name;
  String? address;
  String? taxCode;
  int? status;

  WorkUnitItemResponse({
    this.code,
    this.name,
    this.address,
    this.taxCode,
    this.status,
  });

  factory WorkUnitItemResponse.fromJson(Map<String, dynamic> json) {
    return _$WorkUnitItemResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WorkUnitItemResponseToJson(this);

  static List<WorkUnitItemResponse> fromJsonArray(
    List<dynamic> jsonArray,
  ) {
    return jsonArray
        .map(
          (dynamic e) =>
              WorkUnitItemResponse.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }
}
