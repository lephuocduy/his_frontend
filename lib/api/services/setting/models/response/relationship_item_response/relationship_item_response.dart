import 'package:json_annotation/json_annotation.dart';

part 'relationship_item_response.g.dart';

@JsonSerializable()
class RelationshipItemResponse {
  int? status;
  int? code;
  String? description;

  RelationshipItemResponse({this.status, this.code, this.description});

  factory RelationshipItemResponse.fromJson(Map<String, dynamic> json) {
    return _$RelationshipItemResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RelationshipItemResponseToJson(this);

  static List<RelationshipItemResponse> fromJsonArray(
    List<dynamic> jsonArray,
  ) {
    return jsonArray
        .map(
          (dynamic e) =>
              RelationshipItemResponse.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }
}
