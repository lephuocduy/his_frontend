import 'package:flutter/material.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/constants/app_text_theme.dart';
import 'package:his_frontend/data/repositories/setting/models/output/item_base_model.dart';

class FilterDropdownTable extends StatefulWidget {
  final List<ItemBaseModel> items;
  final ItemBaseModel? value;
  final TextStyle? styleTextDisplay;
  final Widget? hint;
  final Function(ItemBaseModel?) onChanged;
  final bool isEnabled;

  const FilterDropdownTable({
    super.key,
    required this.items,
    this.value,
    this.styleTextDisplay,
    this.hint,
    required this.onChanged,
    this.isEnabled = true,
  });

  @override
  _FilterDropdownTableState createState() => _FilterDropdownTableState();
}

class _FilterDropdownTableState extends State<FilterDropdownTable> {
  ItemBaseModel? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: Align(
        alignment: Alignment.centerRight,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<ItemBaseModel>(
            padding: const EdgeInsets.only(
              left: 4,
            ),
            isExpanded: true,
            dropdownColor: AppColor.c_FFFFFF,
            focusColor: AppColor.c_FFFFFF,
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColor.c_47535D,
            ),
            style: textTheme.bodyMedium?.copyWith(
              color: AppColor.c_47535D,
            ),
            value: _selectedItem,
            hint: widget.hint ?? const SizedBox(),
            items: widget.items
                .map(
                  (item) => DropdownMenuItem<ItemBaseModel>(
                    value: item,
                    child: Text(
                      item.name ?? '',
                      style: widget.styleTextDisplay ??
                          textTheme.bodyMedium?.copyWith(
                            color: AppColor.c_47535D,
                          ),
                    ),
                  ),
                )
                .toList(),
            onChanged: widget.isEnabled
                ? (value) {
                    setState(() {
                      _selectedItem = value;
                    });
                    widget.onChanged(value);
                  }
                : null,
          ),
        ),
      ),
    );
  }
}
