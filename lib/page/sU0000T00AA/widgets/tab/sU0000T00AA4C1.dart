part of '../../sU0000T00AA.dart';

class SU0000T00AA4C1 extends StatelessWidget {
  const SU0000T00AA4C1({super.key});

  @override
  Widget build(BuildContext context) {
    final dataHeader = [
      'STT',
      'Ngày khám',
      'Nguồn',
      'Hành động',
    ];
    return BlocBuilder<SU0000T00AABloc, SU0000T00AAState>(
      builder: (context, state) {
        return Column(
          children: [
            spaceH12,
            Expanded(
              child: DisplayTableCustomColumn(
                columnWidths: const {
                  0: FlexColumnWidth(0.1),
                  1: FlexColumnWidth(0.25),
                  2: FlexColumnWidth(0.4),
                  3: FlexColumnWidth(0.25),
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
      },
    );
  }
}
