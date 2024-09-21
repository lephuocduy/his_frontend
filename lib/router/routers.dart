import 'package:go_router/go_router.dart';
import 'package:his_frontend/page/home/home_page.dart';
import 'package:his_frontend/page/login/login_page.dart';
import 'package:his_frontend/page/reception/reception_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) => const HomePage(),
      routes: <RouteBase>[
        GoRoute(
          path: 'reception',
          builder: (context, state) => const ReceptionPage(),
        ),
      ],
    ),
    GoRoute(
      name:
          'login', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
  ],
);
