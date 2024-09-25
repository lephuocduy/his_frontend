import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/constants/app_icon.dart';
import 'package:his_frontend/core/utils/spaces.dart';
import 'package:his_frontend/core/widgets/button/app_button.dart';
import 'package:his_frontend/core/widgets/components/title_container.dart';
import 'package:his_frontend/core/widgets/input/drop_down_item_base.dart';
import 'package:his_frontend/core/widgets/input/input_num/num_input_type_enum.dart';
import 'package:his_frontend/core/widgets/input/input_num/text_field_num_input.dart';
import 'package:his_frontend/core/widgets/input/text_field_date_picker/text_field_date_picker.dart';
import 'package:his_frontend/core/widgets/input/text_field_input.dart';
import 'package:his_frontend/data/local/base_data.dart';
import 'package:his_frontend/data/repositories/setting/models/output/item_base_model.dart';

import 'info_patient_bloc.dart';
import 'info_patient_state.dart';

class InfoPatientPage extends StatefulWidget {
  const InfoPatientPage({super.key});

  @override
  State<InfoPatientPage> createState() => _InfoPatientPageState();
}

class _InfoPatientPageState extends State<InfoPatientPage> {
  late InfoReceptionBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = InfoReceptionBloc()..onStart();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<InfoReceptionBloc, InfoReceptionState>(
        builder: (context, state) {
          return Scaffold(
              backgroundColor: AppColor.white,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppButton(
                            title: 'Nhập mới',
                            icon: AppIcon.add,
                            onTap: () {},
                          ),
                          spaceW12,
                          AppButton(
                            title: 'Lưu',
                            icon: AppIcon.save,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    _form(context),
                  ],
                ),
              ));
        },
      ),
    );
  }

  Widget _form(BuildContext context) {
    return TitleContainer(
      title: 'THÔNG TIN BỆNH NHÂN',
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                const TextFieldInput(
                  title: 'Họ và tên',
                  widthTitle: 112,
                  textAlignEndTitle: true,
                ),
                spaceW8,
                const TextFieldInput(
                  title: 'Mã bệnh nhân',
                  widthTitle: 104,
                  textAlignEndTitle: true,
                ),
                spaceW8,
                Expanded(
                  child: Row(
                    children: [
                      TextFieldNumInput(
                        title: 'Tuổi',
                        textAlign: TextAlign.start,
                        isExpanded: true,
                        initialValue: null,
                        onChanged: (p0) {
                          //bloc.onEditYear(value: int.tryParse(p0.toString()));
                        },
                        numInputType: NumInputType.nonNegativeInteger,
                      ),
                      spaceW8,
                      TextFieldDatePicker(
                        flex: 3,
                        title: 'Ngày sinh',
                        initialValue: null,
                        onChanged: (p0) {
                          if (p0 != null) {
                            //bloc.onChangeFormData(effectiveDateFrom: p0);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            spaceH8,
            Row(
              children: [
                DropdownItemBase(
                  title: 'Giới tính',
                  widthTitle: 88,
                  textAlignEndTitle: true,
                  items: genderList,
                  value: null,
                  onChanged: (value) {
                    //
                  },
                ),
                spaceW8,
                DropdownItemBase(
                  title: 'Dân tộc',
                  items: [
                    ItemBaseModel(id: 1, name: 'Kinh'),
                    ItemBaseModel(id: 2, name: 'Tày'),
                    ItemBaseModel(id: 3, name: 'Mường'),
                  ],
                  value: null,
                  onChanged: (value) {
                    //
                  },
                ),
                spaceW8,
                DropdownItemBase(
                  title: 'Nghề nghiệp',
                  items: [
                    ItemBaseModel(id: 1, name: 'Công nhân'),
                    ItemBaseModel(id: 2, name: 'Nông dân'),
                    ItemBaseModel(id: 3, name: 'Giáo viên'),
                  ],
                  value: null,
                )
              ],
            ),
            spaceH8,
            Row(
              children: [
                DropdownItemBase(
                  title: 'Quốc tịch',
                  widthTitle: 104,
                  textAlignEndTitle: true,
                  items: [
                    ItemBaseModel(id: 1, name: 'Việt Nam'),
                    ItemBaseModel(id: 2, name: 'Lào'),
                    ItemBaseModel(id: 3, name: 'Campuchia'),
                  ],
                  value: null,
                  onChanged: (value) {
                    //
                  },
                ),
                spaceW8,
                DropdownItemBase(
                  title: 'Quốc gia',
                  items: [
                    ItemBaseModel(id: 1, name: 'Hà Nội'),
                    ItemBaseModel(id: 2, name: 'Hồ Chí Minh'),
                    ItemBaseModel(id: 3, name: 'Đà Nẵng'),
                  ],
                  value: null,
                  onChanged: (value) {
                    //
                  },
                ),
                spaceW8,
                const TextFieldInput(
                  title: 'Số nhà/ Đường',
                  widthTitle: 112,
                  textAlignEndTitle: true,
                ),
              ],
            ),
            spaceH8,
            Row(
              children: [
                DropdownItemBase(
                  title: 'Thành phố/ Tỉnh',
                  widthTitle: 112,
                  textAlignEndTitle: true,
                  items: [
                    ItemBaseModel(id: 1, name: 'Hà Nội'),
                    ItemBaseModel(id: 2, name: 'Hồ Chí Minh'),
                    ItemBaseModel(id: 3, name: 'Đà Nẵng'),
                  ],
                  value: null,
                  onChanged: (value) {
                    //
                  },
                ),
                spaceW8,
                DropdownItemBase(
                  title: 'Quận/ Huyện',
                  widthTitle: 104,
                  textAlignEndTitle: true,
                  items: [
                    ItemBaseModel(id: 1, name: 'Quận 1'),
                    ItemBaseModel(id: 2, name: 'Quận 2'),
                    ItemBaseModel(id: 3, name: 'Quận 3'),
                  ],
                  value: null,
                  onChanged: (value) {
                    //
                  },
                ),
                spaceW8,
                DropdownItemBase(
                  title: 'Phường/ Xã',
                  widthTitle: 88,
                  textAlignEndTitle: true,
                  items: [
                    ItemBaseModel(id: 1, name: 'Phường 1'),
                    ItemBaseModel(id: 2, name: 'Phường 2'),
                    ItemBaseModel(id: 3, name: 'Phường 3'),
                  ],
                  value: null,
                  onChanged: (value) {
                    //
                  },
                ),
              ],
            ),
            spaceH8,
            Row(
              children: [
                TextFieldNumInput(
                  title: 'Mã số BHXH',
                  textAlign: TextAlign.start,
                  widthTitle: 112,
                  textAlignEndTitle: true,
                  isExpanded: true,
                  initialValue: null,
                  onChanged: (p0) {
                    //bloc.onEditYear(value: int.tryParse(p0.toString()));
                  },
                  numInputType: NumInputType.normal,
                ),
                DropdownItemBase(
                  title: 'Nhóm máu',
                  items: [
                    ItemBaseModel(id: 1, name: 'A'),
                    ItemBaseModel(id: 2, name: 'B'),
                    ItemBaseModel(id: 3, name: 'AB'),
                  ],
                  value: null,
                  onChanged: (value) {
                    //
                  },
                ),
                spaceW8,
                Expanded(
                  child: Row(
                    children: [
                      const TextFieldInput(
                        title: 'Email',
                      ),
                      spaceW8,
                      TextFieldNumInput(
                        title: 'Số điện thoại',
                        textAlign: TextAlign.start,
                        isExpanded: true,
                        initialValue: null,
                        onChanged: (p0) {
                          //bloc.onEditYear(value: int.tryParse(p0.toString()));
                        },
                        numInputType: NumInputType.normal,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            spaceH8,
            Row(
              children: [
                DropdownItemBase(
                  title: 'ĐV. Công tác',
                  widthTitle: 104,
                  textAlignEndTitle: true,
                  items: [
                    ItemBaseModel(id: 1, name: 'Công ty A'),
                    ItemBaseModel(id: 2, name: 'Công ty B'),
                    ItemBaseModel(id: 3, name: 'Công ty C'),
                  ],
                  value: null,
                  onChanged: (value) {
                    //
                  },
                ),
                spaceW8,
                TextFieldNumInput(
                  title: 'Mã số thuế',
                  textAlign: TextAlign.start,
                  isExpanded: true,
                  initialValue: null,
                  onChanged: (p0) {
                    //bloc.onEditYear(value: int.tryParse(p0.toString()));
                  },
                  numInputType: NumInputType.normal,
                ),
                spaceW8,
                const TextFieldInput(
                  title: 'ĐC. Công tác',
                  widthTitle: 88,
                  textAlignEndTitle: true,
                ),
              ],
            ),
            spaceH8,
            Row(
              children: [
                TextFieldNumInput(
                  title: 'CCCD',
                  textAlign: TextAlign.start,
                  widthTitle: 112,
                  textAlignEndTitle: true,
                  isExpanded: true,
                  initialValue: null,
                  onChanged: (p0) {
                    //bloc.onEditYear(value: int.tryParse(p0.toString()));
                  },
                  numInputType: NumInputType.normal,
                ),
                spaceW8,
                TextFieldDatePicker(
                  title: 'Ngày cấp',
                  initialValue: null,
                  onChanged: (p0) {
                    if (p0 != null) {
                      //bloc.onChangeFormData(effectiveDateFrom: p0);
                    }
                  },
                ),
                spaceW8,
                const TextFieldInput(
                  title: 'Nơi cấp',
                  widthTitle: 88,
                  textAlignEndTitle: true,
                ),
              ],
            ),
            spaceH8,
            Row(
              children: [
                const TextFieldInput(
                  title: 'Tên người thân',
                  widthTitle: 112,
                  textAlignEndTitle: true,
                ),
                spaceW8,
                Expanded(
                  child: Row(
                    children: [
                      DropdownItemBase(
                        title: 'Quan hệ với NT',
                        widthTitle: 104,
                        textAlignEndTitle: true,
                        items: [
                          ItemBaseModel(id: 1, name: 'Bố'),
                          ItemBaseModel(id: 2, name: 'Mẹ'),
                          ItemBaseModel(id: 3, name: 'Vợ'),
                        ],
                        value: null,
                        onChanged: (value) {
                          //
                        },
                      ),
                      spaceW8,
                      TextFieldNumInput(
                        title: 'Số điện\nthoại NT',
                        textAlign: TextAlign.start,
                        isExpanded: true,
                        initialValue: null,
                        onChanged: (p0) {
                          //bloc.onEditYear(value: int.tryParse(p0.toString()));
                        },
                        numInputType: NumInputType.normal,
                      ),
                    ],
                  ),
                ),
                spaceW8,
                const TextFieldInput(
                  title: 'Địa chỉ NT',
                  widthTitle: 88,
                  textAlignEndTitle: true,
                ),
              ],
            ),
            spaceH8,
            const Row(
              children: [
                TextFieldInput(
                  title: 'Ghi chú',
                  widthTitle: 88,
                  textAlignEndTitle: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
