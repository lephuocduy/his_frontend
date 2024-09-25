import 'package:json_annotation/json_annotation.dart';

part 'ethnic_item_response.g.dart';

@JsonSerializable()
class EthnicItemResponse {
  String? code;
  String? name;
  String? description;
  int? status;
  bool? isSystem;
  String? govtCode;

  EthnicItemResponse({
    this.code,
    this.name,
    this.description,
    this.status,
    this.isSystem,
    this.govtCode,
  });

  factory EthnicItemResponse.fromJson(Map<String, dynamic> json) {
    return _$EthnicItemResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EthnicItemResponseToJson(this);

  static List<EthnicItemResponse> fromJsonArray(
    List<dynamic> jsonArray,
  ) {
    return jsonArray
        .map(
          (dynamic e) => EthnicItemResponse.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }
}
