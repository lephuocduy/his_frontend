import 'package:go_router/go_router.dart';
import 'package:his_frontend/page/reception/reception_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    // GoRoute(
    //   name: 'home',
    //   path: '/home',
    //   builder: (context, state) => const HomePage(),
    //   routes: <RouteBase>[
    //     GoRoute(
    //       path: 'reception',
    //       builder: (context, state) => const ReceptionPage(),
    //       routes: <RouteBase>[
    //         GoRoute(
    //           path: 'info-patient',
    //           builder: (context, state) => const InfoPatientPage(),
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
    // GoRoute(
    //   name:
    //       'login', // Optional, add name to your routes. Allows you navigate by name instead of path
    //   path: '/',
    //   builder: (context, state) => const LoginPage(),
    // ),
    GoRoute(
      name:
          'reception', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/',
      builder: (context, state) => const ReceptionPage(),
    ),
  ],
);
