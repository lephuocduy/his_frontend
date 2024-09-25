import 'package:flutter/material.dart';
import 'package:his_frontend/core/constants/app_color.dart';

import 'number_paginator.dart';

class CustomTable extends StatefulWidget {
  const CustomTable({
    super.key,
    this.padding = 12,
    required this.headerData,
    this.filterData,
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
    this.onTap,
    this.onDoubleTap,
    this.colorHeaderTable = AppColor.colorHeaderTableBlue,
    this.colorBodyTable = AppColor.colorBodyTableBlue,
    this.colorInsideTable = AppColor.colorInsideTableBlue,
  });

  final double padding;
  // dòng tên cột
  final List<Widget> headerData;
  // dòng để filter
  final List<Widget>? filterData;
  // dòng chứa data của bảng
  final List<List<Widget>> rowsData;
  final Map<int, TableColumnWidth> columnWidths;
  final int? limit;
  final int? currentPage;
  final int? numberPages;
  //
  final void Function(int)? onLimitChange;
  final void Function(int)? onPageChange;
  // custom color
  final Color? horizontalInsideColor;
  final Color? colorHeaderTable;
  final Color? colorBodyTable;
  final Color? colorInsideTable;
  // setting
  final bool isNeverScroll;
  // size number paging
  final bool isSizeSmall;
  // function
  final void Function(int rowIndex, int columnIndex)? onTap;
  final void Function(int rowIndex, int columnIndex)? onDoubleTap;

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  int? _selectedRowIndex;

  void onSelectRow(int value) {
    setState(() {
      _selectedRowIndex = value;
    });
  }

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
                        widget.colorInsideTable!,
                  ),
                  verticalInside: const BorderSide(color: AppColor.white),
                ),
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: widget.colorHeaderTable!,
                    ),
                    children: List.generate(
                      widget.headerData.length,
                      (index) {
                        return TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: widget.headerData[index]));
                      },
                    ),
                  ),
                  if (widget.filterData != null) ...[
                    TableRow(
                      decoration: const BoxDecoration(
                        color: AppColor.c_FFFFFF,
                      ),
                      children: List.generate(
                        widget.filterData!.length,
                        (index) {
                          return TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: widget.filterData![index],
                          );
                        },
                      ),
                    ),
                  ],
                  ...List.generate(widget.rowsData.length, (rowIndex) {
                    return TableRow(
                      decoration: BoxDecoration(
                        color: _selectedRowIndex == rowIndex
                            ? AppColor.c_2F80ED.withOpacity(0.2)
                            : rowIndex % 2 == 0
                                ? widget.colorBodyTable
                                : AppColor.white,
                      ),
                      children: List.generate(
                        widget.rowsData[rowIndex].length,
                        (columnIndex) {
                          return TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 4,
                              ),
                              child: InkWell(
                                onTap: widget.onTap != null
                                    ? () {
                                        widget.onTap!(rowIndex, columnIndex);
                                        onSelectRow(rowIndex);
                                      }
                                    : null,
                                onDoubleTap: widget.onDoubleTap != null
                                    ? () {
                                        widget.onDoubleTap!(
                                            rowIndex, columnIndex);
                                        onSelectRow(rowIndex);
                                      }
                                    : null,
                                child: widget.rowsData[rowIndex][columnIndex],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ],
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
