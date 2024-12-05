part of '../sU0000T00AA.dart';

class _SU0000T00AA2 extends StatelessWidget {
  const _SU0000T00AA2();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SU0000T00AABloc, SU0000T00AAState>(
      builder: (context, state) {
        return TitleContainer(
          title: '3. THÔNG TIN ĐỢT ĐĂNG KÝ',
          button: AppButton(
            title: 'Lưu',
            icon: AppIcon.save,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    DropdownItemBase(
                      widthTitle: 124,
                      textAlignEndTitle: true,
                      isRequired: true,
                      title: 'Đối tượng',
                      hintText: 'Dịch vụ',
                      items: state.dataDropdownList,
                    ),
                    spaceW24,
                    const AppCheckBox(
                      prefixTitle: 'BHTM',
                    ),
                    spaceW12,
                    const AppCheckBox(
                      prefixTitle: 'VIP',
                    ),
                    spaceW12,
                    const AppCheckBox(
                      prefixTitle: 'Trả sau',
                    ),
                  ],
                ),
                spaceH8,
                const Row(
                  children: [
                    TextFieldInput(
                      widthTitle: 124,
                      textAlignEndTitle: true,
                      title: 'Lý do tiếp nhận',
                    ),
                  ],
                ),
                spaceH8,
                Row(
                  children: [
                    DropdownItemBase(
                      widthTitle: 124,
                      textAlignEndTitle: true,
                      title: 'Hình thức đến',
                      isRequired: true,
                      items: state.dataDropdownList,
                    )
                  ],
                ),
                spaceH8,
                Row(
                  children: [
                    DropdownItemBase(
                      title: 'Đơn vị giới thiệu',
                      widthTitle: 124,
                      textAlignEndTitle: true,
                      isRequired: true,
                      items: state.dataDropdownList,
                    )
                  ],
                ),
                spaceH8,
                Row(
                  children: [
                    DropdownItemBase(
                      widthTitle: 124,
                      textAlignEndTitle: true,
                      title: 'Bác sĩ giới thiệu',
                      isRequired: true,
                      items: state.dataDropdownList,
                    ),
                    spaceW12,
                    DropdownItemBase(
                      title: 'CTV giới thiệu',
                      isRequired: true,
                      items: state.dataDropdownList,
                    ),
                  ],
                ),
                spaceH8,
                const Row(
                  children: [
                    TextFieldInput(
                      widthTitle: 124,
                      textAlignEndTitle: true,
                      title: 'SID',
                      hintText: 'SID sinh từ HIS',
                    ),
                  ],
                ),
                spaceH8,
                Row(
                  children: [
                    SizedBox(
                      width: 124,
                      child: Text(
                        'Tiếp nhận lúc',
                        style: textTheme.labelLarge?.copyWith(
                          color: AppColor.c_323F4B,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    spaceW12,
                    TextFieldDatePicker(
                      initialValue: DateTime.now(),
                      isDateTimePicker: true,
                      isEnabled: false,
                    ),
                    spaceW8,
                    const TextFieldInput(
                      hintText: 'MADANGKY',
                      isEnabled: false,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
