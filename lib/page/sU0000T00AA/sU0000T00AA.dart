import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/constants/app_icon.dart';
import 'package:his_frontend/core/constants/app_text_theme.dart';
import 'package:his_frontend/core/utils/currency_text.dart';
import 'package:his_frontend/core/utils/spaces.dart';
import 'package:his_frontend/core/widgets/button/app_button.dart';
import 'package:his_frontend/core/widgets/button/app_button_outline.dart';
import 'package:his_frontend/core/widgets/components/display_tab_bar.dart';
import 'package:his_frontend/core/widgets/components/title_container.dart';
import 'package:his_frontend/core/widgets/input/app_checkbox.dart';
import 'package:his_frontend/core/widgets/input/drop_down_item_base.dart';
import 'package:his_frontend/core/widgets/input/required_label.dart';
import 'package:his_frontend/core/widgets/input/text_field_date_picker/text_field_date_picker.dart';
import 'package:his_frontend/core/widgets/input/text_field_input.dart';
import 'package:his_frontend/core/widgets/table/display_table_custom_column.dart';
import 'package:his_frontend/core/widgets/table/filter_table/filter_currency_table.dart';
import 'package:his_frontend/core/widgets/table/filter_table/filter_drop_down_table.dart';
import 'package:his_frontend/data/repositories/setting/models/output/item_base_model.dart';

import 'bloc/sU0000T00AA_bloc.dart';
import 'bloc/sU0000T00AA_state.dart';

part 'widgets/sU0000T00AA0.dart';
part 'widgets/sU0000T00AA1.dart';
part 'widgets/sU0000T00AA2.dart';
part 'widgets/sU0000T00AA3.dart';
part './widgets/tab/sU0000T00AA4C0.dart';
part './widgets/tab/sU0000T00AA4C1.dart';
part './widgets/tab/sU0000T00AA4C2.dart';
part './widgets/popup/sU0000T00AAP0.dart';

class SU0000T00AA extends StatefulWidget {
  const SU0000T00AA({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<SU0000T00AA> createState() => _SU0000T00AAState();
}

class _SU0000T00AAState extends State<SU0000T00AA> {
  late SU0000T00AABloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = SU0000T00AABloc()..onStart();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<SU0000T00AABloc, SU0000T00AAState>(
        builder: (context, state) {
          return Scaffold(
            body: Container(
              color: AppColor.white,
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppButton(
                        title: 'Tìm người bệnh',
                        icon: AppIcon.search,
                        onTap: () {
                          SU0000T00AAP0.show(context);
                        },
                      ),
                      spaceW4,
                      AppButton(
                        title: 'Xem hồ sơ',
                        icon: AppIcon.view,
                      ),
                      spaceW4,
                      AppButton(
                        title: 'In phiếu đăng ký',
                        icon: AppIcon.print,
                      ),
                      spaceW4,
                      const AppButton(
                        title: 'Thu ngân',
                      ),
                      const SizedBox(
                        width: 12,
                        height: 24,
                        child: VerticalDivider(
                          color: AppColor.c_9E9E9E,
                        ),
                      ),
                      AppButton(
                        title: 'Lưu',
                        icon: AppIcon.save,
                      ),
                      spaceW4,
                      AppButtonOutline(
                        title: 'Hủy',
                        icon: AppIcon.cancel,
                      ),
                    ],
                  ),
                  spaceH8,
                  Expanded(
                    child: SingleChildScrollView(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                const _SU0000T00AA0(),
                                spaceH8,
                                const _SU0000T00AA1(),
                              ],
                            ),
                          ),
                          spaceW8,
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Expanded(
                                      flex: 3,
                                      child: _SU0000T00AA2(),
                                    ),
                                    spaceW8,
                                    Expanded(
                                      child: _uploadAvatar(),
                                    ),
                                  ],
                                ),
                                spaceH8,
                                const _SU0000T00AA3()
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _uploadAvatar() {
    return TitleContainer(
      title: 'ẢNH ĐẠI DIỆN',
      button: AppButton(
        title: 'Lưu',
        icon: AppIcon.save,
      ),
      child: Column(
        children: [
          spaceH16,
          bloc.state.avatarChange != null
              ? Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.network(
                      bloc.state.avatarChange!.path,
                      height: 160,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      right: -5,
                      top: -5,
                      child: InkWell(
                        onTap: () {
                          bloc.onDeleteAvatar();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 3,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ]),
                          child: const Icon(
                            Icons.close,
                            size: 14,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : Container(
                  height: 160,
                  width: 130,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.colorBorderGrey,
                    ),
                  ),
                ),
          spaceH12,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(
                icon: AppIcon.camera,
                title: 'Chụp',
              ),
              spaceW12,
              AppButton(
                icon: AppIcon.upload,
                title: 'Tải lên',
                onTap: () {
                  bloc.onImagePicker();
                },
              ),
            ],
          ),
          spaceH12,
        ],
      ),
    );
  }
}
