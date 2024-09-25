import 'package:json_annotation/json_annotation.dart';

part 'benefit_item_response.g.dart';

@JsonSerializable()
class BenefitItemResponse {
  int? category;
  int? serviceAttribute;
  int? weight;
  int? code;
  String? description;

  BenefitItemResponse({
    this.category,
    this.serviceAttribute,
    this.weight,
    this.code,
    this.description,
  });

  factory BenefitItemResponse.fromJson(Map<String, dynamic> json) {
    return _$BenefitItemResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BenefitItemResponseToJson(this);

  static List<BenefitItemResponse> fromJsonArray(
    List<dynamic> jsonArray,
  ) {
    return jsonArray
        .map(
          (dynamic e) =>
              BenefitItemResponse.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }
}
