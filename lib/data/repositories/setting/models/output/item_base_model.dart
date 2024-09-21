import 'package:copy_with_extension/copy_with_extension.dart';

part 'item_base_model.g.dart';

@CopyWith()
class ItemBaseModel {
  final int? id;
  final String? name;

  ItemBaseModel({
    this.id,
    this.name,
  });
}
