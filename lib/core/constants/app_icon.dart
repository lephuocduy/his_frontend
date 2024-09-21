import 'package:flutter/material.dart';

import 'app_color.dart';

const size = 16.0;

class AppIcon {
  AppIcon._();

  // In
  static Icon login = const Icon(
    Icons.login,
    color: AppColor.white,
    size: size,
  );

  // In
  static Icon add = const Icon(
    Icons.add_circle,
    color: AppColor.white,
    size: size,
  );

  // Sửa
  static Icon edit = const Icon(
    Icons.edit,
    color: AppColor.white,
    size: size,
  );

  // Sửa nhưng mà màu xanh
  static Icon editFoundation = const Icon(
    Icons.edit,
    color: AppColor.foundation,
    size: size,
  );

  // Kế thừa
  static Icon copy = const Icon(
    Icons.copy,
    color: AppColor.white,
    size: size,
  );

  // Xóa trắng dữ liệu
  static Icon removeCircle = const Icon(
    Icons.remove_circle,
    color: AppColor.colorIconBlue,
    size: size,
  );

  // Xem hồ sơ
  static Icon view = const Icon(
    Icons.visibility,
    color: AppColor.white,
    size: size,
  );

  // In
  static Icon print = const Icon(
    Icons.print,
    color: AppColor.white,
    size: size,
  );

  // Ký số
  static Icon digiSign = const Icon(
    Icons.drive_file_rename_outline_outlined,
    color: AppColor.white,
    size: size + 2,
  );

  // Hủy
  static Icon cancel = const Icon(
    Icons.cancel,
    color: AppColor.colorIconBlue,
    size: size,
  );

  // Vô hiệu hóa chứng thư số
  static Icon cancelRed = const Icon(
    Icons.cancel,
    color: AppColor.colorIconRed,
    size: size,
  );

  // Xuất biểu đồ
  static Icon insertChart = const Icon(
    Icons.insert_chart_outlined_outlined,
    color: AppColor.white,
    size: size + 2,
  );

  // Xuất báo cáo
  static Icon description = const Icon(
    Icons.description_outlined,
    color: AppColor.white,
    size: size + 2,
  );

  // Xóa
  static Icon delete = const Icon(
    Icons.delete_outline,
    color: AppColor.colorIconRed,
    size: size + 2,
  );

  // chụp
  static Icon camera = const Icon(
    Icons.camera_alt_rounded,
    color: AppColor.white,
    size: size,
  );

  // tải lên
  static Icon upload = const Icon(
    Icons.cloud_upload,
    color: AppColor.white,
    size: size,
  );

  // tải xuống
  static Icon download = const Icon(
    Icons.cloud_download,
    color: AppColor.white,
    size: size,
  );

  // Thu về bên trái
  static Widget arrowCircleLeft = Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      border: Border.all(
        color: AppColor.colorBorderBlue,
      ),
      shape: BoxShape.circle,
    ),
    child: const Icon(
      Icons.arrow_back_ios_new_rounded,
      color: AppColor.colorIconBlue,
      size: size - 2,
    ),
  );

  // Thu về bên phải
  static Widget arrowCircleRight = Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      border: Border.all(
        color: AppColor.colorBorderBlue,
      ),
      shape: BoxShape.circle,
    ),
    child: const Icon(
      Icons.arrow_forward_ios_rounded,
      color: AppColor.colorIconBlue,
      size: size - 2,
    ),
  );

  // Di chuyển lên
  static Widget arrowUpCircle = Container(
    padding: const EdgeInsets.all(2),
    decoration: const BoxDecoration(
      color: AppColor.white,
      shape: BoxShape.circle,
    ),
    child: const Icon(
      Icons.arrow_upward_rounded,
      color: AppColor.colorIconBlue,
      size: size - 4,
    ),
  );
  static Icon arrowUp = const Icon(
    Icons.arrow_upward_rounded,
    color: AppColor.white,
    size: size,
  );

  // Di chuyển xuống
  static Widget arrowDownCircle = Container(
    padding: const EdgeInsets.all(2),
    decoration: const BoxDecoration(
      color: AppColor.white,
      shape: BoxShape.circle,
    ),
    child: const Icon(
      Icons.arrow_downward_rounded,
      color: AppColor.colorIconBlue,
      size: size - 4,
    ),
  );
  static Icon arrowDown = const Icon(
    Icons.arrow_downward_rounded,
    color: AppColor.white,
    size: size,
  );

  // Xóa row
  static Widget closePinkCircle = Container(
    padding: const EdgeInsets.all(2),
    decoration: const BoxDecoration(
      color: AppColor.colorIconPink2,
      shape: BoxShape.circle,
    ),
    child: const Icon(
      Icons.close,
      color: AppColor.colorIconBlue,
      size: size - 4,
    ),
  );

  // Tìm or Lọc
  static Icon search = const Icon(
    Icons.search,
    color: AppColor.white,
    size: size,
  );

  // dấu "-"
  static Icon removeOutlined = const Icon(
    Icons.remove_outlined,
    color: AppColor.colorIconGrey,
    size: size,
  );

  // Tìm or Lọc
  static Icon menuFoundation = const Icon(
    Icons.menu,
    color: AppColor.foundation,
    size: size,
  );

  // Đóng popup
  static Widget closeRounded = Container(
    decoration:
        const BoxDecoration(shape: BoxShape.circle, color: AppColor.redBoder),
    margin: const EdgeInsets.all(5),
    child: const Icon(
      Icons.close_rounded,
      color: AppColor.white,
      size: 20,
    ),
  );

  // Công thức
  static Icon settings = const Icon(
    Icons.settings,
    color: AppColor.white,
    size: size,
  );

  // Kiểm tra
  static Icon check = const Icon(
    Icons.check_circle_outline_outlined,
    color: AppColor.white,
    size: size,
  );

  // Kích hoạt chứng thư số
  static Icon checkCircle = const Icon(
    Icons.check_circle,
    color: AppColor.white,
    size: size,
  );

  // Phát hành
  static Icon verify = const Icon(
    Icons.verified_user_outlined,
    color: AppColor.white,
    size: size,
  );

  // Gỡ duyệt
  static Icon error = const Icon(
    Icons.error_outline_rounded,
    color: AppColor.colorBorderRed,
    size: size,
  );

  // Kéo thả file
  static Icon file = const Icon(
    Icons.insert_drive_file,
    color: AppColor.c_323F4B,
    size: size + 24,
  );
}
