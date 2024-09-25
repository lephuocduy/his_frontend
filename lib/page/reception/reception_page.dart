import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/constants/app_icon.dart';
import 'package:his_frontend/core/constants/app_text_theme.dart';
import 'package:his_frontend/core/utils/date_time.dart';
import 'package:his_frontend/core/utils/spaces.dart';
import 'package:his_frontend/core/widgets/button/app_button.dart';
import 'package:his_frontend/core/widgets/button/app_button_outline.dart';
import 'package:his_frontend/core/widgets/components/title_container.dart';
import 'package:his_frontend/core/widgets/input/app_checkbox.dart';
import 'package:his_frontend/core/widgets/input/drop_down_item_base.dart';
import 'package:his_frontend/core/widgets/input/input_num/num_input_type_enum.dart';
import 'package:his_frontend/core/widgets/input/input_num/text_field_num_input.dart';
import 'package:his_frontend/core/widgets/input/text_field_date_picker/text_field_date_picker.dart';
import 'package:his_frontend/core/widgets/input/text_field_input.dart';
import 'package:his_frontend/core/widgets/popup/toast/custom_toast.dart';
import 'package:his_frontend/core/widgets/popup/toast/toast_enum.dart';
import 'package:his_frontend/core/widgets/table/custom_table.dart';
import 'package:his_frontend/data/local/base_data.dart';
import 'package:his_frontend/data/repositories/setting/models/output/item_base_model.dart';

import 'reception_bloc.dart';
import 'reception_state.dart';

class ReceptionPage extends StatefulWidget {
  const ReceptionPage({super.key});

  @override
  State<ReceptionPage> createState() => _ReceptionPageState();
}

class _ReceptionPageState extends State<ReceptionPage> {
  late ReceptionBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ReceptionBloc()..onStart();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocListener<ReceptionBloc, ReceptionState>(
        listenWhen: (previous, current) =>
            previous.isSubmit != current.isSubmit,
        listener: (context, state) {
          if (state.isSuccess) {
            showCustomToast(
              context: context,
              message: 'Tạo tiếp nhận thành công',
              type: ToastEnum.success,
            );
          } else {
            showCustomToast(
              context: context,
              message: 'Tạo tiếp nhận thất bại, vui lòng thử lại',
              type: ToastEnum.error,
            );
          }
        },
        child: BlocBuilder<ReceptionBloc, ReceptionState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColor.white,
              body: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      key: ObjectKey(state.isLoading),
                      children: [
                        _form1(context),
                        spaceH8,
                        _form2(context),
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
                                isEnabled: state.isValid,
                                title: 'Lưu',
                                icon: AppIcon.save,
                                onTap: () {
                                  bloc.onSave();
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 0,
                          color: AppColor.colorBorderGrey.withOpacity(0.5),
                        ),
                        spaceH8,
                        IntrinsicHeight(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: _tableLeft(context),
                                ),
                                spaceW8,
                                Expanded(child: _tableRight(context)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (state.isLoading)
                    Container(
                      color: Colors.black
                          .withOpacity(0.1), // Semi-transparent overlay
                      child: Center(
                        child: Text(
                          'Đang xử lí dữ liệu...',
                          style: textTheme.bodyLarge?.copyWith(
                            color: AppColor.c_006EA9,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _tableLeft(BuildContext context) {
    final dataHeader = [
      'Hành động',
      'Mã TN',
      'Ngày khám',
      'Phòng khám',
      'Dịch vụ',
      'Mã thẻ BHYT',
      'Nhân viên',
      'Bác sĩ khám',
    ];
    return CustomTable(
      horizontalInsideColor: AppColor.colorInsideTableGreen,
      columnWidths: const {
        0: FlexColumnWidth(0.1),
        1: FlexColumnWidth(0.1),
        2: FlexColumnWidth(0.1),
        3: FlexColumnWidth(0.1),
        4: FlexColumnWidth(0.1),
        5: FlexColumnWidth(0.1),
        6: FlexColumnWidth(0.1),
        7: FlexColumnWidth(0.1),
      },
      headerData: dataHeader
          .map(
            (e) => Padding(
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
          )
          .toList(),
      rowsData: [
        ...bloc.state.receptionList.mapIndexed(
          (index, e) => [
            Center(
              child: AppButton(
                width: 32,
                icon: AppIcon.closePinkCircle,
                onTap: () {
                  //bloc.onDeleteLinkTable(index);
                },
              ),
            ),
            Center(child: Text(e.code ?? '')),
            Center(
              child: Text(e.examinationDate?.format(pattern: dd_mm_yyyy) ?? ''),
            ),
            Center(child: Text(e.clinic ?? '')),
            Center(child: Text(e.service ?? '')),
            Center(child: Text(e.healthInsuranceCode ?? '')),
            Center(child: Text(e.staff ?? '')),
            Center(child: Text(e.examinationDoctor ?? '')),
          ],
        ),
      ],
    );
  }

  Widget _tableRight(BuildContext context) {
    final dataHeader = [
      'Phòng khám',
      'Tổng số',
      'Mã thẻ BHYT',
      'Ưu tiên',
      'Đã khám',
      'Chưa khám',
    ];
    return CustomTable(
      horizontalInsideColor: AppColor.colorInsideTableGreen,
      columnWidths: const {
        0: FlexColumnWidth(0.12),
        1: FlexColumnWidth(0.1),
        2: FlexColumnWidth(0.1),
        3: FlexColumnWidth(0.1),
        4: FlexColumnWidth(0.1),
        5: FlexColumnWidth(0.1),
      },
      headerData: dataHeader
          .map(
            (e) => Padding(
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
          )
          .toList(),
      rowsData: [
        ...bloc.state.receptionFilterList.mapIndexed(
          (index, e) => [
            Center(child: Text(e.clinic ?? '')),
            Center(child: Text(e.total ?? '')),
            Center(child: Text(e.healthInsuranceCode ?? '')),
            Center(
              child: AppCheckBox(
                value: e.prioritize,
              ),
            ),
            Center(
              child: AppCheckBox(
                value: e.examined,
              ),
            ),
            Center(
              child: AppCheckBox(
                value: !(e.examined ?? false),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _form2(BuildContext context) {
    return TitleContainer(
      title: 'THÔNG TIN TIẾP NHẬN',
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                TextFieldDatePicker(
                  title: 'Ngày tiếp nhận',
                  isRequired: true,
                  widthTitle: 112,
                  textAlignEndTitle: true,
                  initialValue: bloc.state.visitOn,
                  onChanged: (value) {
                    if (value != null) {
                      bloc.onChangeData(visitOn: value);
                    }
                  },
                ),
                spaceW8,
                const TextFieldInput(
                  title: 'Mã bệnh nhân',
                ),
                spaceW8,
                Expanded(
                    child: Row(
                  children: [
                    TextFieldNumInput(
                      title: 'Số hồ sơ',
                      textAlign: TextAlign.start,
                      isExpanded: true,
                      initialValue: null,
                      onChanged: (value) {},
                      numInputType: NumInputType.normal,
                    ),
                    spaceW8,
                    TextFieldNumInput(
                      title: 'STT Khám',
                      textAlign: TextAlign.start,
                      isExpanded: true,
                      initialValue: null,
                      onChanged: (value) {},
                      numInputType: NumInputType.normal,
                    ),
                  ],
                ))
              ],
            ),
            spaceH8,
            Row(
              children: [
                DropdownItemBase(
                  title: 'Quyền lợi',
                  isRequired: true,
                  widthTitle: 112,
                  textAlignEndTitle: true,
                  items: bloc.state.benefitList,
                  value: bloc.state.benefit,
                  onChanged: (value) {},
                ),
                spaceW8,
                TextFieldNumInput(
                  isEnabled: false,
                  title: 'BHYT',
                  textAlign: TextAlign.start,
                  isExpanded: true,
                  initialValue: null,
                  onChanged: (value) {},
                  numInputType: NumInputType.normal,
                ),
                spaceW8,
                AppCheckBox(
                  isEnabled: false,
                  suffixTitle: 'Thẻ tạm',
                  value: false,
                  onTap: () {},
                ),
                spaceW8,
                DropdownItemBase(
                  title: 'Nơi ĐK KCBBĐ',
                  isEnabled: false,
                  items: [
                    ItemBaseModel(id: 1, name: 'Hồ Chí Minh'),
                    ItemBaseModel(id: 2, name: 'Hà Nội'),
                    ItemBaseModel(id: 3, name: 'Đà Nẵng'),
                  ],
                  value: null,
                  onChanged: (value) {},
                ),
                spaceW8,
                Expanded(
                  child: Row(
                    children: [
                      DropdownItemBase(
                        title: 'Giá trị từ',
                        isEnabled: false,
                        items: [
                          ItemBaseModel(id: 1, name: 'Hồ Chí Minh'),
                          ItemBaseModel(id: 2, name: 'Hà Nội'),
                          ItemBaseModel(id: 3, name: 'Đà Nẵng'),
                        ],
                        value: null,
                        onChanged: (value) {},
                      ),
                      spaceW8,
                      DropdownItemBase(
                        title: 'Đến',
                        isEnabled: false,
                        items: [
                          ItemBaseModel(id: 1, name: 'Hồ Chí Minh'),
                          ItemBaseModel(id: 2, name: 'Hà Nội'),
                          ItemBaseModel(id: 3, name: 'Đà Nẵng'),
                        ],
                        value: null,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            spaceH8,
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      DropdownItemBase(
                        title: 'Tuyến',
                        isEnabled: false,
                        widthTitle: 112,
                        textAlignEndTitle: true,
                        items: [
                          ItemBaseModel(id: 1, name: 'Hồ Chí Minh'),
                          ItemBaseModel(id: 2, name: 'Hà Nội'),
                          ItemBaseModel(id: 3, name: 'Đà Nẵng'),
                        ],
                        value: null,
                        onChanged: (value) {},
                      ),
                      spaceW8,
                      DropdownItemBase(
                        title: 'Loại',
                        isEnabled: false,
                        items: [
                          ItemBaseModel(id: 1, name: 'Hồ Chí Minh'),
                          ItemBaseModel(id: 2, name: 'Hà Nội'),
                          ItemBaseModel(id: 3, name: 'Đà Nẵng'),
                        ],
                        value: null,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
                spaceW8,
                Expanded(
                  child: Row(
                    children: [
                      DropdownItemBase(
                        title: 'ĐT 130',
                        isEnabled: false,
                        items: [
                          ItemBaseModel(id: 1, name: 'Hồ Chí Minh'),
                          ItemBaseModel(id: 2, name: 'Hà Nội'),
                          ItemBaseModel(id: 3, name: 'Đà Nẵng'),
                        ],
                        value: null,
                        onChanged: (value) {},
                      ),
                      spaceW8,
                      TextFieldNumInput(
                        title: 'Mức hưởng (%)',
                        isEnabled: false,
                        textAlign: TextAlign.start,
                        isExpanded: true,
                        initialValue: null,
                        onChanged: (value) {},
                        numInputType: NumInputType.normal,
                      ),
                    ],
                  ),
                ),
                spaceW8,
                Expanded(
                  child: Row(
                    children: [
                      AppCheckBox(
                        suffixTitle: '5 năm 6 tháng',
                        isEnabled: false,
                        value: false,
                        onTap: () {},
                      ),
                      spaceW8,
                      DropdownItemBase(
                        isEnabled: false,
                        items: [
                          ItemBaseModel(id: 1, name: 'Hồ Chí Minh'),
                          ItemBaseModel(id: 2, name: 'Hà Nội'),
                          ItemBaseModel(id: 3, name: 'Đà Nẵng'),
                        ],
                        value: null,
                        onChanged: (value) {},
                      ),
                      spaceW8,
                      DropdownItemBase(
                        title: 'KV',
                        isEnabled: false,
                        items: [
                          ItemBaseModel(id: 1, name: 'Hồ Chí Minh'),
                          ItemBaseModel(id: 2, name: 'Hà Nội'),
                          ItemBaseModel(id: 3, name: 'Đà Nẵng'),
                        ],
                        value: null,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            spaceH8,
            Row(
              children: [
                const TextFieldInput(
                  flex: 1,
                  title: 'Số nhà/ Đường',
                  isEnabled: false,
                  widthTitle: 112,
                  textAlignEndTitle: true,
                ),
                spaceW8,
                DropdownItemBase(
                  title: 'Thành phố/ Tỉnh',
                  isEnabled: false,
                  isRequired: true,
                  items: [
                    ItemBaseModel(id: 1, name: 'Hà Nội'),
                    ItemBaseModel(id: 2, name: 'Hồ Chí Minh'),
                    ItemBaseModel(id: 3, name: 'Đà Nẵng'),
                  ],
                  value: null,
                  onChanged: (value) {},
                ),
                spaceW8,
                DropdownItemBase(
                  title: 'Quận/ Huyện',
                  isEnabled: false,
                  isRequired: true,
                  items: [
                    ItemBaseModel(id: 1, name: 'Quận 1'),
                    ItemBaseModel(id: 2, name: 'Quận 2'),
                    ItemBaseModel(id: 3, name: 'Quận 3'),
                  ],
                  value: null,
                  onChanged: (value) {},
                ),
                spaceW8,
                DropdownItemBase(
                  title: 'Phường/ Xã',
                  isEnabled: false,
                  isRequired: true,
                  items: [
                    ItemBaseModel(id: 1, name: 'Phường 1'),
                    ItemBaseModel(id: 2, name: 'Phường 2'),
                    ItemBaseModel(id: 3, name: 'Phường 3'),
                  ],
                  value: null,
                  onChanged: (value) {},
                )
              ],
            ),
            spaceH8,
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      DropdownItemBase(
                        title: 'Chuyển tuyến',
                        isEnabled: false,
                        widthTitle: 112,
                        textAlignEndTitle: true,
                        items: [
                          ItemBaseModel(id: 1, name: 'Tuyến 1'),
                          ItemBaseModel(id: 2, name: 'Tuyến 2'),
                          ItemBaseModel(id: 3, name: 'Tuyến 3'),
                        ],
                        value: null,
                        onChanged: (value) {},
                      ),
                      spaceW8,
                      AppCheckBox(
                        suffixTitle: 'Hưởng đúng tuyến',
                        isEnabled: false,
                        value: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                spaceW8,
                Expanded(
                  child: Row(
                    children: [
                      AppCheckBox(
                        suffixTitle: 'Tái khám',
                        isEnabled: false,
                        value: false,
                        onTap: () {},
                      ),
                      spaceW8,
                      DropdownItemBase(
                        isEnabled: false,
                        items: [
                          ItemBaseModel(id: 1, name: 'Tuyến 1'),
                          ItemBaseModel(id: 2, name: 'Tuyến 2'),
                          ItemBaseModel(id: 3, name: 'Tuyến 3'),
                        ],
                      ),
                    ],
                  ),
                ),
                spaceW8,
                Expanded(
                  child: Row(
                    children: [
                      TextFieldNumInput(
                        title: 'Số lần',
                        isEnabled: false,
                        isExpanded: true,
                        initialValue: null,
                        onChanged: (value) {},
                        numInputType: NumInputType.normal,
                      ),
                      spaceW8,
                      AppCheckBox(
                        suffixTitle: 'Hẹn kết quả',
                        isEnabled: false,
                        value: false,
                        onTap: () {},
                      ),
                      spaceW8,
                      AppCheckBox(
                        suffixTitle: 'Cận nghèo',
                        isEnabled: false,
                        value: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
            spaceH8,
            Row(
              children: [
                DropdownItemBase(
                  title: 'Phòng khám',
                  isRequired: true,
                  widthTitle: 112,
                  textAlignEndTitle: true,
                  items: bloc.state.clinicList,
                  value: bloc.state.wardUnit,
                  onChanged: (value) {
                    bloc.onChangeData(wardUnit: value);
                  },
                ),
                spaceW8,
                DropdownItemBase(
                  title: 'Dịch vụ khám',
                  isRequired: true,
                  items: bloc.state.medicalExaminationServiceList,
                  value: bloc.state.medService,
                  onChanged: (value) {
                    bloc.onChangeData(medService: value);
                  },
                ),
                spaceW8,
                Expanded(
                  child: Row(
                    children: [
                      AppCheckBox(
                        suffixTitle: 'Trả sau',
                        isEnabled: false,
                        value: false,
                        onTap: () {},
                      ),
                      spaceW8,
                      AppCheckBox(
                        suffixTitle: 'BN được ưu tiên',
                        isEnabled: false,
                        value: false,
                        onTap: () {},
                      ),
                      spaceW8,
                      AppCheckBox(
                        suffixTitle: 'Mua sổ KB',
                        isEnabled: false,
                        value: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
            spaceH8,
            Row(
              children: [
                DropdownItemBase(
                  title: 'CL Khám',
                  isEnabled: false,
                  widthTitle: 112,
                  textAlignEndTitle: true,
                  items: [
                    ItemBaseModel(id: 1, name: 'CL 1'),
                    ItemBaseModel(id: 2, name: 'CL 2'),
                    ItemBaseModel(id: 3, name: 'CL 3'),
                  ],
                ),
                spaceW8,
                Expanded(
                  child: Row(
                    children: [
                      AppButtonOutline(
                        title: 'Thu tiền',
                        isEnabled: false,
                        onTap: () {},
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
                spaceW8,
                Expanded(child: Container()),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _form1(BuildContext context) {
    return TitleContainer(
      title: 'THÔNG TIN BỆNH NHÂN',
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                TextFieldInput(
                  title: 'Mã bệnh nhân',
                  widthTitle: 112,
                  textAlignEndTitle: true,
                  onChanged: (value) {
                    bloc.onChangeData(patientCode: value);
                  },
                  // prevIconWidget: AppButton(
                  //   icon: AppIcon.view,
                  //   onTap: () {
                  //     context.go('/home/reception/info-patient');
                  //   },
                  // ),
                ),
                spaceW8,
                TextFieldInput(
                  title: 'Họ và tên',
                  widthTitle: 104,
                  textAlignEndTitle: true,
                  isRequired: true,
                  onChanged: (value) {
                    bloc.onChangeData(fullname: value);
                  },
                ),
                spaceW8,
                Expanded(
                  child: Row(
                    children: [
                      DropdownItemBase(
                        flex: 9,
                        title: 'Giới tính',
                        widthTitle: 96,
                        textAlignEndTitle: true,
                        isRequired: true,
                        items: genderList,
                        value: bloc.state.gender,
                        onChanged: (value) {
                          bloc.onChangeData(gender: value);
                        },
                      ),
                      spaceW8,
                      TextFieldDatePicker(
                        flex: 10,
                        title: 'Ngày sinh',
                        initialValue: bloc.state.dob,
                        isRequired: true,
                        onChanged: (value) {
                          if (value != null) {
                            bloc.onChangeData(dob: value);
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            spaceH8,
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      TextFieldNumInput(
                        flex: 10,
                        title: 'CCCD',
                        textAlign: TextAlign.start,
                        widthTitle: 112,
                        textAlignEndTitle: true,
                        isExpanded: true,
                        initialValue: null,
                        onChanged: (value) {},
                        numInputType: NumInputType.normal,
                      ),
                      spaceW8,
                      TextFieldNumInput(
                        flex: 9,
                        title: 'Số điện thoại',
                        textAlign: TextAlign.start,
                        isExpanded: true,
                        initialValue: null,
                        onChanged: (value) {},
                        numInputType: NumInputType.normal,
                      ),
                    ],
                  ),
                ),
                spaceW8,
                Expanded(
                  child: Row(
                    children: [
                      DropdownItemBase(
                        flex: 10,
                        title: 'Quốc tịch',
                        widthTitle: 104,
                        textAlignEndTitle: true,
                        isRequired: true,
                        items: bloc.state.nationList,
                        value: bloc.state.country,
                        onChanged: (value) {
                          bloc.onChangeData(country: value);
                        },
                      ),
                      spaceW8,
                      DropdownItemBase(
                        flex: 9,
                        title: 'Dân tộc',
                        isRequired: true,
                        items: bloc.state.ethnicList,
                        value: bloc.state.ethnic,
                        onChanged: (value) {
                          bloc.onChangeData(ethnic: value);
                        },
                      ),
                    ],
                  ),
                ),
                spaceW8,
                Expanded(
                  child: Row(
                    children: [
                      DropdownItemBase(
                        flex: 3,
                        title: 'Nghề nghiệp',
                        isRequired: true,
                        widthTitle: 96,
                        textAlignEndTitle: true,
                        items: bloc.state.jobList,
                        value: null,
                        onChanged: (value) {},
                      ),
                      spaceW8,
                      TextFieldNumInput(
                        flex: 2,
                        title: 'MST',
                        textAlign: TextAlign.start,
                        isExpanded: true,
                        initialValue: null,
                        onChanged: (value) {},
                        numInputType: NumInputType.normal,
                      ),
                    ],
                  ),
                )
              ],
            ),
            spaceH8,
            Row(
              children: [
                DropdownItemBase(
                  title: 'Thành phố/ Tỉnh',
                  widthTitle: 112,
                  textAlignEndTitle: true,
                  items: bloc.state.cityList,
                  value: bloc.state.city,
                  onChanged: (value) {
                    bloc.onChangeData(city: value);
                  },
                ),
                spaceW8,
                DropdownItemBase(
                  title: 'Quận/ Huyện',
                  widthTitle: 104,
                  textAlignEndTitle: true,
                  items: bloc.state.districtList,
                  value: bloc.state.district,
                  onChanged: (value) {
                    bloc.onChangeData(district: value);
                  },
                ),
                spaceW8,
                DropdownItemBase(
                  title: 'Phường/ Xã',
                  widthTitle: 96,
                  textAlignEndTitle: true,
                  items: bloc.state.wardList,
                  value: bloc.state.ward,
                  onChanged: (value) {
                    bloc.onChangeData(ward: value);
                  },
                )
              ],
            ),
            spaceH8,
            Row(
              children: [
                TextFieldInput(
                  flex: 1,
                  title: 'Số nhà/ Đường',
                  isRequired: true,
                  widthTitle: 112,
                  textAlignEndTitle: true,
                  onChanged: (value) {
                    bloc.onChangeData(address: value);
                  },
                ),
                spaceW8,
                DropdownItemBase(
                  title: 'ĐV. Công tác',
                  widthTitle: 104,
                  textAlignEndTitle: true,
                  items: bloc.state.workUnitList,
                  value: null,
                  onChanged: (value) {},
                ),
                spaceW8,
                const TextFieldInput(
                  title: 'ĐC. Công tác',
                  widthTitle: 96,
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
                        items: bloc.state.relationshipList,
                        value: null,
                        onChanged: (value) {},
                      ),
                      spaceW8,
                      TextFieldNumInput(
                        title: 'Số điện\nthoại NT',
                        textAlign: TextAlign.start,
                        isExpanded: true,
                        initialValue: null,
                        onChanged: (value) {},
                        numInputType: NumInputType.normal,
                      ),
                    ],
                  ),
                ),
                spaceW8,
                const TextFieldInput(
                  title: 'Địa chỉ NT',
                  widthTitle: 96,
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
