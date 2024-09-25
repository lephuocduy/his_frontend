import 'package:json_annotation/json_annotation.dart';

part 'nation_item_response.g.dart';

@JsonSerializable()
class NationItemResponse {
  String? code;
  String? name;
  int? status;
  dynamic insCode;
  bool? isSystem;
  @JsonKey(name: 'nameVN')
  dynamic nameVn;

  NationItemResponse({
    this.code,
    this.name,
    this.status,
    this.insCode,
    this.isSystem,
    this.nameVn,
  });

  factory NationItemResponse.fromJson(Map<String, dynamic> json) {
    return _$NationItemResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NationItemResponseToJson(this);

  static List<NationItemResponse> fromJsonArray(
    List<dynamic> jsonArray,
  ) {
    return jsonArray
        .map(
          (dynamic e) => NationItemResponse.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }
}
