import 'package:flutter/material.dart';
import 'package:his_frontend/core/constants/app_color.dart';

import 'number_paginator.dart';

class DisplayTableCustomColumn extends StatefulWidget {
  const DisplayTableCustomColumn({
    super.key,
    this.padding = 12,
    required this.rowsData,
    required this.columnWidths,
    this.limit,
    this.currentPage,
    this.numberPages,
    this.onLimitChange,
    this.onPageChange,
    this.horizontalInsideColor,
    this.isNeverScroll = false,
    this.isSizeSmall = false,
  });

  final double padding;
  final List<TableRow> rowsData;
  final Map<int, TableColumnWidth> columnWidths;
  final int? limit;
  final int? currentPage;
  final int? numberPages;
  //
  final void Function(int)? onLimitChange;
  final void Function(int)? onPageChange;
  // custom color
  final Color? horizontalInsideColor;
  // setting
  final bool isNeverScroll;
  // size number paging
  final bool isSizeSmall;

  @override
  State<DisplayTableCustomColumn> createState() =>
      _DisplayTableCustomColumnState();
}

class _DisplayTableCustomColumnState extends State<DisplayTableCustomColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width - widget.padding * 2,
            child: SingleChildScrollView(
              physics: widget.isNeverScroll
                  ? const NeverScrollableScrollPhysics()
                  : null,
              child: Table(
                columnWidths: widget.columnWidths,
                border: TableBorder(
                  top: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  right: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  bottom: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  left: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  horizontalInside: BorderSide(
                    color: widget.horizontalInsideColor ??
                        AppColor.colorInsideTableBlue,
                  ),
                  verticalInside: const BorderSide(color: AppColor.white),
                ),
                children: widget.rowsData,
              ),
            ),
          ),
        ),
        if (widget.limit != null &&
            widget.numberPages != null &&
            widget.currentPage != null &&
            widget.onLimitChange != null &&
            widget.onPageChange != null) ...[
          Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  NumberPaginator(
                    isSizeSmall: widget.isSizeSmall,
                    limit: widget.limit!,
                    numberPages: widget.numberPages!,
                    currentPage: widget.currentPage!,
                    onLimitChange: (int limit) {
                      widget.onLimitChange!.call(limit);
                    },
                    onPageChange: (int page) {
                      widget.onPageChange!.call(page);
                    },
                  ),
                  const SizedBox(
                    width: 12,
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              )
            ],
          ),
        ]
      ],
    );
  }
}
