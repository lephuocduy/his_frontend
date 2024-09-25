import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/constants/app_icon.dart';
import 'package:his_frontend/core/constants/app_text_theme.dart';
import 'package:his_frontend/core/utils/spaces.dart';
import 'package:his_frontend/core/widgets/button/app_button.dart';
import 'package:his_frontend/core/widgets/input/drop_down_item_base.dart';
import 'package:his_frontend/core/widgets/input/text_field_input.dart';
import 'package:his_frontend/core/widgets/input/text_field_input_password.dart';
import 'package:his_frontend/core/widgets/popup/toast/custom_toast.dart';
import 'package:his_frontend/core/widgets/popup/toast/toast_enum.dart';
import 'package:his_frontend/gen/assets.gen.dart';

import 'login_bloc.dart';
import 'login_state.dart';
import 'models/login_status.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = LoginBloc()..onStart();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocListener<LoginBloc, LoginState>(
        listenWhen: (previous, current) =>
            current.loginStatus != previous.loginStatus,
        listener: (context, state) {
          if (state.loginStatus == LoginStatus.loginSuccess) {
            context.go(Uri(
              path: '/home',
            ).toString());
          } else if (state.loginStatus == LoginStatus.loginFailure) {
            showCustomToast(
              context: context,
              message: 'Mật khẩu không đúng',
              type: ToastEnum.error,
            );
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Assets.images.background.image().image,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 500,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColor.colorBorderBlue),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'HỆ THỐNG QUẢN LÝ THÔNG TIN BỆNH VIỆN',
                          style: textTheme.titleLarge?.copyWith(
                            color: AppColor.c_006EA9,
                          ),
                        ),
                        spaceH24,
                        Row(
                          children: [
                            TextFieldInput(
                              title: 'Tài khoản',
                              widthTitle: 68,
                              textAlignEndTitle: true,
                              hintText: 'Nhập tài khoản',
                              onChanged: (value) {
                                bloc.onChangeAccount(value);
                              },
                            ),
                          ],
                        ),
                        spaceH8,
                        Row(
                          children: [
                            TextFieldInputPassword(
                              title: 'Mật khẩu',
                              widthTitle: 68,
                              textAlignEndTitle: true,
                              hintText: 'Nhập mật khẩu',
                              onChanged: (value) {
                                bloc.onChangePassword(value);
                              },
                            ),
                          ],
                        ),
                        spaceH8,
                        Row(
                          children: [
                            DropdownItemBase(
                              title: 'Khoa',
                              widthTitle: 68,
                              textAlignEndTitle: true,
                              hintText: "Chọn khoa",
                              items: state.departmentList ?? [],
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
                            DropdownItemBase(
                              title: 'Phòng',
                              widthTitle: 68,
                              textAlignEndTitle: true,
                              hintText: "Chọn phòng",
                              items: state.roomList ?? [],
                              value: null,
                              onChanged: (value) {
                                //
                              },
                            ),
                          ],
                        ),
                        spaceH16,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AppButton(
                              isEnabled: state.isValid,
                              title: 'Đăng nhập',
                              icon: AppIcon.login,
                              onTap: () {
                                bloc.onLogin();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
