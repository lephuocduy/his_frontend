import 'package:json_annotation/json_annotation.dart';

part 'city_item_response.g.dart';

@JsonSerializable()
class CityItemResponse {
  String? code;
  String? country;
  dynamic region;
  String? name;
  String? abbr;
  bool? isSystem;

  CityItemResponse({
    this.code,
    this.country,
    this.region,
    this.name,
    this.abbr,
    this.isSystem,
  });

  factory CityItemResponse.fromJson(Map<String, dynamic> json) {
    return _$CityItemResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CityItemResponseToJson(this);

  static List<CityItemResponse> fromJsonArray(
    List<dynamic> jsonArray,
  ) {
    return jsonArray
        .map(
          (dynamic e) => CityItemResponse.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }
}
