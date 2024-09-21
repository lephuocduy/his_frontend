import 'package:flutter/material.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/utils/spaces.dart';
import 'package:his_frontend/core/widgets/components/title_container.dart';
import 'package:his_frontend/core/widgets/input/text_field_input.dart';

class ReceptionPage extends StatelessWidget {
  const ReceptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        children: [
          TitleContainer(
            title: 'THÔNG TIN TIẾP NHẬN',
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    children: [
                      const TextFieldInput(
                        title: 'Mã bệnh nhân',
                        widthTitle: 120,
                        textAlignEndTitle: true,
                      ),
                      spaceW16,
                      const TextFieldInput(
                        title: 'Họ và tên',
                        widthTitle: 120,
                        textAlignEndTitle: true,
                      ),
                      spaceW16,
                      const TextFieldInput(
                        title: 'Giới tính',
                        widthTitle: 120,
                        textAlignEndTitle: true,
                      ),
                      spaceW16,
                      const TextFieldInput(
                        title: 'Ngày sinh',
                        widthTitle: 120,
                        textAlignEndTitle: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
