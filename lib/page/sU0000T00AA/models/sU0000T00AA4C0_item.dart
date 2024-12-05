import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:his_frontend/data/repositories/setting/models/output/item_base_model.dart';

part 'sU0000T00AA4C0_item.g.dart';

@CopyWith()
class SU0000T00AA4C0Item {
  final String? id;
  final ItemBaseModel? serviceName;
  final ItemBaseModel? room;
  final double? unitPrice;
  final double? unitPriceSI;
  final bool isEdit;

  SU0000T00AA4C0Item({
    this.id,
    this.serviceName,
    this.room,
    this.unitPrice,
    this.unitPriceSI,
    this.isEdit = false,
  });
}
