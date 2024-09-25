import 'dart:async';

import 'package:flutter/material.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/constants/app_text_theme.dart';
import 'package:his_frontend/core/utils/spaces.dart';

class NumberPaginator extends StatefulWidget {
  const NumberPaginator({
    super.key,
    required this.limit,
    required this.currentPage,
    required this.numberPages,
    required this.onLimitChange,
    required this.onPageChange,
    this.isSizeSmall = false,
  });

  final int limit;
  final int currentPage;
  final int numberPages;
  final void Function(int) onLimitChange;
  final void Function(int) onPageChange;
  final bool isSizeSmall;

  @override
  State<NumberPaginator> createState() => _NumberPaginatorState();
}

class _NumberPaginatorState extends State<NumberPaginator> {
  late Timer _debounce;
  late int _limit;
  late int _currentPage;
  late int _numberPages;

  @override
  void initState() {
    super.initState();
    _debounce = Timer(Duration.zero, () {});
    _limit = widget.limit;
    _currentPage = widget.currentPage;
    _numberPages = widget.numberPages;
  }

  @override
  void dispose() {
    _debounce.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _displayQuantity(),
        _numberPages != 0 ? spaceW16 : space0,
        if (_numberPages == 0)
          ...[]
        else if (_numberPages == 1) ...[
          _item(1),
        ] else if (_numberPages == 2) ...[
          _item(1),
          spaceW12,
          _item(2),
        ] else if (_numberPages == 3) ...[
          _item(1),
          spaceW12,
          _item(2),
          spaceW12,
          _item(3),
        ] else if (_numberPages == 4) ...[
          _item(1),
          spaceW12,
          _item(2),
          spaceW12,
          _item(3),
          spaceW12,
          _item(4),
        ] else ...[
          if (widget.isSizeSmall ||
              MediaQuery.of(context).size.width < 600) ...[
            _displaySizeSmall(),
          ] else ...[
            _displaySizeLarge(),
          ],
        ]
      ],
    );
  }

  Widget _displaySizeLarge() {
    return Row(
      children: [
        _prevButton(),
        spaceW12,
        _item(1),
        spaceW12,
        if (_currentPage > 2 && _currentPage < _numberPages - 1) ...[
          _middle(),
        ] else ...[
          _item(2),
        ],
        spaceW12,
        if (_currentPage > 2 && _currentPage < _numberPages - 1) ...[
          _item(_currentPage)
        ] else ...[
          _middle(),
        ],
        spaceW12,
        if (_currentPage > 2 && _currentPage < _numberPages - 1) ...[
          _middle(),
        ] else ...[
          _item(_numberPages - 1),
        ],
        spaceW12,
        _item(_numberPages),
        spaceW12,
        _nextButton(),
      ],
    );
  }

  Widget _displaySizeSmall() {
    return Row(
      children: [
        _prevButton(),
        spaceW12,
        if (_currentPage > 1 && _currentPage < _numberPages - 1) ...[
          _middle(),
        ] else ...[
          _item(1),
        ],
        spaceW12,
        if (_currentPage > 1 && _currentPage < _numberPages - 1) ...[
          _item(_currentPage)
        ] else ...[
          _middle(),
        ],
        spaceW12,
        if (_currentPage > 1 && _currentPage < _numberPages - 1) ...[
          _middle(),
        ] else ...[
          _item(_numberPages),
        ],
        spaceW12,
        _nextButton(),
      ],
    );
  }

  Widget _displayQuantity() {
    return Row(
      children: [
        Text(
          'Hiện thị',
          style: textTheme.labelMedium?.copyWith(
            color: AppColor.c_323F4B,
          ),
        ),
        spaceW16,
        Container(
          height: 28,
          padding: const EdgeInsets.only(
            right: 6,
            left: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: AppColor.colorBorderGrey,
            ),
          ),
          child: DropdownButton<int>(
            underline: const SizedBox(),
            value: _limit,
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColor.c_323F4B,
              size: 20,
            ),
            style: textTheme.labelMedium?.copyWith(
              color: AppColor.c_323F4B,
            ),
            dropdownColor: AppColor.c_FFFFFF,
            focusColor: AppColor.c_FFFFFF,
            onChanged: (int? value) {
              widget.onLimitChange.call(value ?? 20);
              _limit = value ?? 20;
            },
            items: [
              10,
              20,
              50,
            ].map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(
                  value.toString(),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _middle() {
    return Container(
      height: 28,
      width: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: AppColor.colorBorderGrey,
          width: 1.5,
        ),
      ),
      child: Center(
        child: Text(
          '...',
          style: textTheme.labelLarge?.copyWith(
            color: AppColor.c_CBD2D9,
          ),
        ),
      ),
    );
  }

  Widget _item(int page) {
    return InkWell(
      onTap: _currentPage != page
          ? () {
              setState(() {
                _currentPage = page;
              });
              widget.onPageChange.call(page);
            }
          : null,
      child: Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: _currentPage == page
                ? AppColor.colorBorderBlue
                : AppColor.colorBorderGrey,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Text(
            page.toString(),
            style: textTheme.labelLarge?.copyWith(
              fontSize: page.toString().length > 2 ? 12 : 14,
              color: _currentPage == page
                  ? AppColor.colorBorderBlue
                  : AppColor.c_323F4B,
            ),
          ),
        ),
      ),
    );
  }

  Widget _prevButton() {
    return InkWell(
      onTap: _currentPage != 1
          ? () {
              if (_debounce.isActive) {
                _debounce.cancel();
              }
              _debounce = Timer(const Duration(milliseconds: 300), () {
                setState(() {
                  _currentPage = _currentPage - 1;
                });
                widget.onPageChange.call(_currentPage);
              });
            }
          : null,
      child: Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          color: _currentPage == 1 ? AppColor.colorBorderGrey : null,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: AppColor.colorBorderGrey,
            width: 1.5,
          ),
        ),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color:
              _currentPage == 1 ? AppColor.c_FFFFFF : AppColor.colorBorderGrey,
          size: 12,
        ),
      ),
    );
  }

  Widget _nextButton() {
    return InkWell(
      onTap: _currentPage != _numberPages
          ? () {
              if (_debounce.isActive) {
                _debounce.cancel();
              }
              _debounce = Timer(const Duration(milliseconds: 300), () {
                setState(() {
                  _currentPage = _currentPage + 1;
                });
                widget.onPageChange.call(_currentPage);
              });
            }
          : null,
      child: Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          color: _currentPage == _numberPages ? AppColor.colorBorderGrey : null,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: AppColor.colorBorderGrey,
            width: 1.5,
          ),
        ),
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          color: _currentPage == _numberPages
              ? AppColor.c_FFFFFF
              : AppColor.colorBorderGrey,
          size: 12,
        ),
      ),
    );
  }
}
