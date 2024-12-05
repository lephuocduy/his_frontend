part of '../../sU0000T00AA.dart';

class SU0000T00AAP0 extends StatefulWidget {
  const SU0000T00AAP0._();

  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (context) => const SU0000T00AAP0._(),
    );
  }

  @override
  State<SU0000T00AAP0> createState() => _SU0000T00AAP0State();
}

class _SU0000T00AAP0State extends State<SU0000T00AAP0> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      titlePadding: EdgeInsets.zero,
      title: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: AppColor.c_D8F1FD,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(4),
            topLeft: Radius.circular(4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tìm kiếm người bệnh',
              style: textTheme.titleMedium?.copyWith(
                color: AppColor.c_323F4B,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.close,
              ),
            )
          ],
        ),
      ),
      contentPadding: const EdgeInsets.all(12),
      content: Builder(builder: (context) {
        return SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const TextFieldInput(
                    flex: 2,
                    hintText: 'Nhập tên / Mã người bệnh / Số nhập viện',
                    suffIconWidget: Icon(
                      Icons.search,
                      size: 20,
                    ),
                  ),
                  spaceW12,
                  DropdownItemBase(
                    title: 'Giới tính',
                    items: [
                      ItemBaseModel(id: 0, name: 'Nam'),
                      ItemBaseModel(id: 1, name: 'Nữ'),
                    ],
                  ),
                  spaceW12,
                  const TextFieldInput(
                    title: 'Năm sinh',
                  ),
                  spaceW12,
                  const TextFieldInput(
                    title: 'Số điện thoại',
                  ),
                  spaceW12,
                  AppButton(
                    title: 'Lọc',
                    icon: AppIcon.search,
                  ),
                ],
              ),
              spaceH12,
              IntrinsicHeight(child: _table())
            ],
          ),
        );
      }),
    );
  }

  Widget _table() {
    final dataHeader = [
      'STT',
      'Mã người bệnh',
      'Họ và tên',
      'Giới tính',
      'Ngày sinh',
      'Địa chỉ',
      'Số điện thoại',
      'Hành động',
    ];
    return Column(
      children: [
        Expanded(
          child: DisplayTableCustomColumn(
            columnWidths: const {
              0: FlexColumnWidth(0.05),
              1: FlexColumnWidth(0.15),
              2: FlexColumnWidth(0.15),
              3: FlexColumnWidth(0.1),
              4: FlexColumnWidth(0.1),
              5: FlexColumnWidth(0.25),
              6: FlexColumnWidth(0.1),
              7: FlexColumnWidth(0.1),
            },
            rowsData: [
              TableRow(
                decoration: const BoxDecoration(
                  color: AppColor.colorHeaderTableBlue,
                ),
                children: dataHeader
                    .map(
                      (e) => TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
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
            ],
          ),
        ),
        spaceH8,
        Text(
          'Không có dữ liệu',
          style: textTheme.bodyMedium?.copyWith(
            color: AppColor.c_47535D,
          ),
        )
      ],
    );
  }
}
