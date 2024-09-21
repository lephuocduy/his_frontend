import 'package:flutter/material.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/constants/app_text_theme.dart';
import 'package:his_frontend/core/utils/spaces.dart';
import 'package:his_frontend/data/repositories/setting/models/output/item_base_model.dart';

import 'required_label.dart';

class DropdownItemBase extends StatefulWidget {
  final String? title;
  final String? hintText;
  final List<ItemBaseModel> items;
  final ItemBaseModel? value;
  final Function(ItemBaseModel?)? onChanged;
  final double? height;
  final double? width;
  final bool isRequired;
  final double? widthTitle;
  final bool textAlignEndTitle;
  final bool isCrossAxisAlignmentTopTitle;
  final int flex;
  final bool isEnabled;
  final Widget? suffix;

  const DropdownItemBase({
    super.key,
    this.title,
    this.hintText,
    required this.items,
    this.value,
    this.onChanged,
    this.height,
    this.width,
    this.isRequired = false,
    this.widthTitle,
    this.textAlignEndTitle = false,
    this.isCrossAxisAlignmentTopTitle = false,
    this.flex = 1,
    this.suffix,
    this.isEnabled = true,
  });

  @override
  _DropdownItemBaseState createState() => _DropdownItemBaseState();
}

class _DropdownItemBaseState extends State<DropdownItemBase> {
  ItemBaseModel? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    double effectiveHeight = widget.height ?? 36.0;

    return Expanded(
      flex: widget.flex,
      child: Row(
        crossAxisAlignment: widget.isCrossAxisAlignmentTopTitle
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          if (widget.title != null) ...[
            if (widget.isRequired) ...[
              SizedBox(
                width: widget.widthTitle,
                child: Row(
                  mainAxisAlignment: widget.textAlignEndTitle
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    RequiredLabel(
                      widget.title ?? '',
                      style: textTheme.labelLarge?.copyWith(
                        color: AppColor.c_323F4B,
                      ),
                    ),
                  ],
                ),
              ),
            ] else ...[
              SizedBox(
                width: widget.widthTitle,
                child: Text(
                  widget.title ?? '',
                  style: textTheme.labelLarge?.copyWith(
                    color: AppColor.c_323F4B,
                  ),
                  textAlign: widget.textAlignEndTitle ? TextAlign.end : null,
                ),
              ),
            ],
            spaceW12,
          ],
          Expanded(
            child: SizedBox(
              height: effectiveHeight,
              width: widget.width,
              child: DropdownButtonFormField<ItemBaseModel>(
                isExpanded: true,
                dropdownColor: Colors.white,
                value: _selectedItem,
                items: widget.items
                    .map(
                      (item) => DropdownMenuItem<ItemBaseModel>(
                        value: item,
                        child: Text(
                          item.name ?? '',
                          style: textTheme.labelLarge?.copyWith(
                            color: AppColor.c_323F4B,
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
                        if (widget.onChanged != null) {
                          widget.onChanged!(value);
                        }
                      }
                    : null,
                hint: widget.hintText != null
                    ? Text(
                        widget.hintText!,
                        style: textTheme.labelLarge?.copyWith(
                          color: AppColor.c_979797,
                        ),
                      )
                    : null,
                icon: widget.suffix ??
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: widget.value != null
                          ? AppColor.c_000000
                          : AppColor.c_979797,
                    ),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColor.colorBorderGrey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColor.colorBorderGrey,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColor.colorBorderGrey,
                    ),
                  ),
                  fillColor: AppColor.c_FFFFFF,
                  filled: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
