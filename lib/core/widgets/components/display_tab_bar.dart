import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/constants/app_text_theme.dart';

class DisplayTabBar extends StatelessWidget {
  const DisplayTabBar({
    super.key,
    required this.tabs,
    required this.currentTab,
    required this.onSelectedTab,
    this.prefixWidget,
  });

  final List<String> tabs;
  final int currentTab;
  final void Function(int) onSelectedTab;
  // Số lượng phải bằng số lượng tabs, cái nào không có thì thêm SizedBox
  final List<Widget>? prefixWidget;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: currentTab,
      length: tabs.length,
      child: TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        onTap: (index) => onSelectedTab.call(index),
        dividerColor: AppColor.colorDividerTab,
        indicatorColor: AppColor.white,
        indicatorWeight: 0.1,
        overlayColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          return states.contains(WidgetState.focused)
              ? null
              : Colors.transparent;
        }),
        labelStyle: textTheme.labelLarge?.copyWith(
          color: AppColor.c_323F4B,
        ),
        unselectedLabelStyle: textTheme.bodyMedium?.copyWith(
          color: AppColor.c_47535D,
        ),
        labelPadding: const EdgeInsets.only(right: 8),
        tabs: tabs
            .mapIndexed(
              (index, e) => _buildItemTab(
                isSelected: index == currentTab,
                label: e,
                // Thêm index để lấy prefixWidget
                index: index,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildItemTab({
    required bool isSelected,
    required String label,
    int? index,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: isSelected
            ? const Border(
                top: BorderSide(color: AppColor.colorSelectedTabBorder),
                right: BorderSide(color: AppColor.colorSelectedTabBorder),
                left: BorderSide(color: AppColor.colorSelectedTabBorder),
              )
            : const Border(
                bottom: BorderSide(color: AppColor.colorSelectedTabBorder),
              ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(6),
          topLeft: Radius.circular(6),
        ),
        color: isSelected
            ? AppColor.colorSelectedTab
            : AppColor.colorUnselectedTab,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          children: [
            prefixWidget != null && index != null
                ? prefixWidget![index]
                : const SizedBox(),
            Text(label),
          ],
        ),
      ),
    );
  }
}
