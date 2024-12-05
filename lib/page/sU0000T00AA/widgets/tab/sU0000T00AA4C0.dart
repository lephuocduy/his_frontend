part of '../../sU0000T00AA.dart';

class SU0000T00AA4C0 extends StatelessWidget {
  const SU0000T00AA4C0({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SU0000T00AABloc>();
    final dataHeader = [
      'STT',
      'Tên dịch vụ',
      'Phòng',
      'Đơn giá DV',
      'Giá BHYT',
      'Hành động',
    ];
    return BlocBuilder<SU0000T00AABloc, SU0000T00AAState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownItemBase(
                    title: 'Gói dịch vụ',
                    items: state.dataDropdownList,
                    hintText: 'Chọn gói dịch vụ',
                    onChanged: (data) {
                      bloc.onSelectServicePackage(data);
                    },
                  ),
                  spaceW8,
                  AppButton(
                    icon: AppIcon.arrowDownCircle,
                    onTap: () {
                      bloc.enterServicePackage();
                    },
                    isEnabled: state.servicePackageSelected != null,
                  ),
                  spaceW8,
                  AppButton(
                    title: 'Thêm dịch vụ',
                    icon: AppIcon.add,
                    onTap: () {
                      bloc.onAddNewItemServiceList();
                    },
                    isEnabled: state.enabledAddService,
                  ),
                  spaceW8,
                  AppButton(
                    title: 'Lưu',
                    icon: AppIcon.save,
                  ),
                ],
              ),
            ),
            //
            Expanded(
              child: DisplayTableCustomColumn(
                columnWidths: const {
                  0: FlexColumnWidth(0.05),
                  1: FlexColumnWidth(0.25),
                  2: FlexColumnWidth(0.2),
                  3: FlexColumnWidth(0.2),
                  4: FlexColumnWidth(0.2),
                  5: FlexColumnWidth(0.1),
                },
                rowsData: [
                  TableRow(
                    decoration: const BoxDecoration(
                      color: AppColor.colorHeaderTableBlue,
                    ),
                    children: dataHeader
                        .map(
                          (e) => TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                              ),
                              child: Text(
                                e,
                                textAlign: TextAlign.center,
                                style: textTheme.labelLarge?.copyWith(
                                  color: AppColor.c_323F4B,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  ...state.serviceList.mapIndexed(
                    (index, e) => TableRow(
                      decoration: BoxDecoration(
                        color:
                            index % 2 == 0 ? AppColor.colorBodyTableBlue : null,
                      ),
                      children: [
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Text(
                            (index + 1).toString(),
                            style: textTheme.bodyMedium?.copyWith(
                              color: AppColor.c_47535D,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: e.isEdit
                              ? FilterDropdownTable(
                                  items: state.dataDropdownList,
                                  value: e.serviceName,
                                  onChanged: (value) {
                                    bloc.onChangeItemServiceList(
                                        index: index, serviceName: value);
                                  },
                                )
                              : Text(
                                  e.serviceName?.name ?? '',
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: AppColor.c_47535D,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: e.isEdit
                              ? FilterDropdownTable(
                                  items: state.dataDropdownList,
                                  value: e.room,
                                  onChanged: (value) {
                                    bloc.onChangeItemServiceList(
                                        index: index, room: value);
                                  },
                                )
                              : Text(
                                  e.room?.name ?? '',
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: AppColor.c_47535D,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: e.isEdit
                              ? FilterCurrencyTable(
                                  disibleSuffixIcon: true,
                                  initialValue:
                                      num.parse((e.unitPrice ?? 0).toString()),
                                  onChanged: (value) {
                                    bloc.onChangeItemServiceList(
                                      index: index,
                                      unitPrice: double.parse(
                                        value.toString(),
                                      ),
                                    );
                                  },
                                )
                              : Text(
                                  currencyFormatWithoutSymbol
                                      .formatDouble(e.unitPrice ?? 0),
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: AppColor.c_47535D,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: e.isEdit
                              ? FilterCurrencyTable(
                                  disibleSuffixIcon: true,
                                  initialValue: num.parse(
                                      (e.unitPriceSI ?? 0).toString()),
                                  onChanged: (value) {
                                    bloc.onChangeItemServiceList(
                                      index: index,
                                      unitPriceSI: double.parse(
                                        value.toString(),
                                      ),
                                    );
                                  },
                                )
                              : Text(
                                  currencyFormatWithoutSymbol
                                      .formatDouble(e.unitPriceSI ?? 0),
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: AppColor.c_47535D,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (e.id == null) ...[
                                if (e.isEdit) ...[
                                  AppButton(
                                    width: 32,
                                    icon: AppIcon.save,
                                    onTap: () {
                                      bloc.onChangeItemServiceList(
                                          index: index, isEdit: false);
                                    },
                                  ),
                                ] else ...[
                                  AppButton(
                                    width: 32,
                                    icon: AppIcon.edit,
                                    onTap: () {
                                      bloc.onChangeItemServiceList(
                                          index: index, isEdit: true);
                                    },
                                  ),
                                ],
                                spaceW4,
                              ],
                              AppButton(
                                width: 32,
                                icon: AppIcon.closePinkCircle,
                                onTap: () {
                                  bloc.onDeleteItemServiceList(index);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: AppColor.c_FDF6B9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'TỔNG CỘNG',
                    style: textTheme.labelLarge?.copyWith(
                      color: AppColor.c_323F4B,
                    ),
                  ),
                  Text(
                    currencyFormatWithoutSymbol
                        .formatDouble(state.unitPriceTotal),
                    style: textTheme.labelLarge?.copyWith(
                      color: AppColor.c_323F4B,
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
