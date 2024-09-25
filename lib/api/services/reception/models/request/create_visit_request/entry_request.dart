import 'package:his_frontend/data/repositories/reception/models/input/create_visit_input/entry_input.dart';
import 'package:json_annotation/json_annotation.dart';

part 'entry_request.g.dart';

@JsonSerializable()
class EntryRequest {
  int? wardUnitId;
  int? medServiceId;
  int? priceId;
  int? insBenefitType;
  int? insBenefitRatio;
  int? createById;
  int? status;
  DateTime? onDate;

  EntryRequest({
    this.wardUnitId,
    this.medServiceId,
    this.priceId,
    this.insBenefitType,
    this.insBenefitRatio,
    this.createById,
    this.status,
    this.onDate,
  });

  factory EntryRequest.fromJson(Map<String, dynamic> json) =>
      _$EntryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EntryRequestToJson(this);

  factory EntryRequest.toApiModel(EntryInput input) {
    return EntryRequest(
      wardUnitId: input.wardUnitId,
      medServiceId: input.medServiceId,
      priceId: input.priceId,
      insBenefitType: input.insBenefitType,
      insBenefitRatio: input.insBenefitRatio,
      createById: input.createById,
      status: input.status,
      onDate: input.onDate,
    );
  }
}
