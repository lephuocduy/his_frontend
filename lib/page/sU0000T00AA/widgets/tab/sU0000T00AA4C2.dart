part of '../../sU0000T00AA.dart';

class SU0000T00AA4C2 extends StatelessWidget {
  const SU0000T00AA4C2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(child: _form()),
        IntrinsicHeight(child: _table()),
      ],
    );
  }

  Widget _form() {
    return BlocBuilder<SU0000T00AABloc, SU0000T00AAState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              DropdownItemBase(
                isRequired: true,
                title: 'Loại tài liệu',
                widthTitle: 92,
                textAlignEndTitle: true,
                items: state.dataDropdownList,
              ),
              spaceH8,
              const TextFieldInput(
                isRequired: true,
                title: 'Tên tài liệu',
                widthTitle: 92,
                textAlignEndTitle: true,
              ),
              spaceH8,
              const TextFieldInput(
                title: 'Ghi chú',
                widthTitle: 92,
                textAlignEndTitle: true,
              ),
              spaceH8,
              Row(
                children: [
                  SizedBox(
                    width: 92,
                    child: Text(
                      'Tiếp nhận lúc',
                      style: textTheme.labelLarge?.copyWith(
                        color: AppColor.c_323F4B,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  spaceW12,
                  Expanded(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColor.colorBorderGrey),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.file_present,
                              size: 24,
                              color: AppColor.colorIconGrey,
                            ),
                            spaceW8,
                            Text(
                              'Kéo thả hoặc bấm vào đây để tải tập tin lên',
                              style: textTheme.bodyMedium?.copyWith(
                                color: AppColor.c_979797,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _table() {
    final dataHeader = [
      'STT',
      'Tài liệu',
      'Đường dẫn',
      'Chú thích',
    ];
    return Column(
      children: [
        Expanded(
          child: DisplayTableCustomColumn(
            columnWidths: const {
              0: FlexColumnWidth(0.1),
              1: FlexColumnWidth(0.3),
              2: FlexColumnWidth(0.3),
              3: FlexColumnWidth(0.3),
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
