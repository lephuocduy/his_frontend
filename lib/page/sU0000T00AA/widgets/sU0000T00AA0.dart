part of '../sU0000T00AA.dart';

class _SU0000T00AA0 extends StatelessWidget {
  const _SU0000T00AA0();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SU0000T00AABloc, SU0000T00AAState>(
      builder: (context, state) {
        return TitleContainer(
          title: '1. THÔNG TIN HÀNH CHÍNH',
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
                    SizedBox(
                      width: 104,
                      child: RequiredLabel(
                        'Họ và tên',
                        style: textTheme.labelLarge?.copyWith(
                          color: AppColor.c_323F4B,
                        ),
                      ),
                    ),
                    spaceW12,
                    const TextFieldInput(
                      flex: 7,
                      hintText: 'Mã người bệnh',
                      isEnabled: false,
                    ),
                    spaceW8,
                    const TextFieldInput(
                      flex: 10,
                      hintText: 'Họ và tên',
                    ),
                  ],
                ),
                spaceH8,
                Row(
                  children: [
                    SizedBox(
                      width: 104,
                      child: RequiredLabel(
                        'Ngày sinh',
                        style: textTheme.labelLarge?.copyWith(
                          color: AppColor.c_323F4B,
                        ),
                      ),
                    ),
                    spaceW12,
                    const TextFieldDatePicker(
                      flex: 8,
                      isRequired: true,
                    ),
                    spaceW8,
                    const TextFieldInput(
                      flex: 4,
                      hintText: 'Tuổi',
                      isEnabled: false,
                    ),
                    spaceW8,
                    DropdownItemBase(
                      flex: 7,
                      hintText: 'Giới tính',
                      items: state.dataDropdownList,
                    ),
                  ],
                ),
                spaceH8,
                Row(
                  children: [
                    SizedBox(
                      width: 104,
                      child: RequiredLabel(
                        'Số điện thoại',
                        style: textTheme.labelLarge?.copyWith(
                          color: AppColor.c_323F4B,
                        ),
                      ),
                    ),
                    spaceW12,
                    const TextFieldInput(
                      flex: 7,
                    ),
                    spaceW8,
                    const TextFieldInput(
                      flex: 10,
                      hintText: 'Email',
                    ),
                  ],
                ),
                spaceH8,
                Row(
                  children: [
                    DropdownItemBase(
                      title: 'Thành phố',
                      isRequired: true,
                      widthTitle: 104,
                      items: state.dataDropdownList,
                    ),
                  ],
                ),
                spaceH8,
                Row(
                  children: [
                    DropdownItemBase(
                      title: 'Quận huyện',
                      isRequired: true,
                      widthTitle: 104,
                      items: state.dataDropdownList,
                    ),
                  ],
                ),
                spaceH8,
                Row(
                  children: [
                    DropdownItemBase(
                      title: 'Phường xã',
                      isRequired: true,
                      widthTitle: 104,
                      items: state.dataDropdownList,
                    ),
                  ],
                ),
                spaceH8,
                const Row(
                  children: [
                    TextFieldInput(
                      isRequired: true,
                      widthTitle: 104,
                      title: 'Địa chỉ',
                    ),
                  ],
                ),
                spaceH8,
                Row(
                  children: [
                    SizedBox(
                      width: 104,
                      child: RequiredLabel(
                        'Quốc tịch',
                        style: textTheme.labelLarge?.copyWith(
                          color: AppColor.c_323F4B,
                        ),
                      ),
                    ),
                    spaceW12,
                    DropdownItemBase(
                      items: state.dataDropdownList,
                    ),
                    spaceW8,
                    DropdownItemBase(
                      hintText: 'D. Tộc',
                      items: state.dataDropdownList,
                    ),
                  ],
                ),
                spaceH8,
                Row(
                  children: [
                    SizedBox(
                      width: 104,
                      child: Text(
                        'CCCD/Passport',
                        style: textTheme.labelLarge?.copyWith(
                          color: AppColor.c_323F4B,
                        ),
                      ),
                    ),
                    spaceW12,
                    const TextFieldInput(),
                    spaceW8,
                    const TextFieldDatePicker(
                      hintText: 'Ngày cấp',
                    ),
                  ],
                ),
                spaceH8,
                const Row(
                  children: [
                    TextFieldInput(
                      widthTitle: 104,
                      title: 'Nơi cấp',
                    ),
                  ],
                ),
                spaceH8,
                Row(
                  children: [
                    SizedBox(
                      width: 104,
                      child: Text(
                        'Nghề nghiệp',
                        style: textTheme.labelLarge?.copyWith(
                          color: AppColor.c_323F4B,
                        ),
                      ),
                    ),
                    spaceW12,
                    DropdownItemBase(
                      items: state.dataDropdownList,
                    ),
                    spaceW8,
                    const TextFieldInput(
                      hintText: 'Nơi công tác',
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
