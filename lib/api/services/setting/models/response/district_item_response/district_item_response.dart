import 'package:json_annotation/json_annotation.dart';

part 'district_item_response.g.dart';

@JsonSerializable()
class DistrictItemResponse {
  String? code;
  String? city;
  String? name;
  String? abbr;
  bool? isSystem;

  DistrictItemResponse(
      {this.code, this.city, this.name, this.abbr, this.isSystem});

  factory DistrictItemResponse.fromJson(Map<String, dynamic> json) {
    return _$DistrictItemResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DistrictItemResponseToJson(this);

  static List<DistrictItemResponse> fromJsonArray(
    List<dynamic> jsonArray,
  ) {
    return jsonArray
        .map(
          (dynamic e) =>
              DistrictItemResponse.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }
}
