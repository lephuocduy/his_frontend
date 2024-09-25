import 'package:json_annotation/json_annotation.dart';

part 'ward_item_response.g.dart';

@JsonSerializable()
class WardItemResponse {
  String? code;
  String? district;
  String? name;
  String? abbr;
  bool? isSystem;

  WardItemResponse(
      {this.code, this.district, this.name, this.abbr, this.isSystem});

  factory WardItemResponse.fromJson(Map<String, dynamic> json) {
    return _$WardItemResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WardItemResponseToJson(this);

  static List<WardItemResponse> fromJsonArray(
    List<dynamic> jsonArray,
  ) {
    return jsonArray
        .map(
          (dynamic e) => WardItemResponse.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }
}
