import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:his_frontend/data/repositories/setting/models/output/item_base_model.dart';
import 'package:his_frontend/page/sU0000T00AA/models/sU0000T00AA4C0_item.dart';
import 'package:image_picker/image_picker.dart';

part 'sU0000T00AA_state.g.dart';

@CopyWith()
class SU0000T00AAState {
  final bool isLoading;
  final List<ItemBaseModel> dataDropdownList;
  final int currentTab;

  //
  final ItemBaseModel? servicePackageSelected;
  final List<SU0000T00AA4C0Item> serviceList;

  //
  final XFile? avatarChange;

  const SU0000T00AAState({
    this.isLoading = false,
    this.dataDropdownList = const [],
    this.currentTab = 0,
    this.servicePackageSelected,
    this.serviceList = const [],
    this.avatarChange,
  });

  double get unitPriceTotal {
    return serviceList.fold(0.0, (sum, item) => sum + (item.unitPrice ?? 0));
  }

  bool get enabledAddService {
    return serviceList.isNotEmpty;
  }
}
