import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/constants/app_text_theme.dart';
import 'package:his_frontend/gen/assets.gen.dart';

import 'models/menu_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> menuItems = [
      MenuItem(index: 0, icon: Icons.person, label: "Tiếp nhận"),
      MenuItem(index: 1, icon: Icons.medical_services, label: "Khám bệnh"),
      MenuItem(index: 2, icon: Icons.local_hotel, label: "Nội trú"),
      MenuItem(index: 3, icon: Icons.monetization_on, label: "Viện phí"),
      MenuItem(index: 4, icon: Icons.health_and_safety, label: "K.Sức khỏe"),
      MenuItem(index: 5, icon: Icons.biotech, label: "Cận lâm sàng"),
      MenuItem(index: 6, icon: Icons.book, label: "Phác đồ"),
      MenuItem(index: 7, icon: Icons.local_hospital, label: "ĐT Ngoại trú"),
      MenuItem(index: 8, icon: Icons.emergency, label: "NT Cấp cứu"),
      MenuItem(index: 9, icon: Icons.devices, label: "Trang thiết bị"),
      MenuItem(index: 10, icon: Icons.settings, label: "Quản lý kho"),
      MenuItem(index: 11, icon: Icons.fastfood, label: "Dinh dưỡng"),
      MenuItem(index: 12, icon: Icons.report, label: "Báo cáo"),
      MenuItem(index: 13, icon: Icons.category, label: "Danh mục"),
      MenuItem(index: 14, icon: Icons.bloodtype, label: "NH máu"),
    ];
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.background.image().image,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: 1.2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              final item = menuItems[index];
              return InkWell(
                onTap: () {
                  if (item.index == 0) {
                    context.go('/home/reception');
                  }
                },
                child: Card(
                  color: AppColor.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item.icon,
                        size: 40,
                        color: AppColor.colorIconBlue,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item.label,
                        textAlign: TextAlign.center,
                        style: textTheme.titleSmall?.copyWith(
                          color: AppColor.c_323F4B,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
