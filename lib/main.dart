import 'package:flutter/material.dart';
import 'package:his_frontend/router/routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'HIS',
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
