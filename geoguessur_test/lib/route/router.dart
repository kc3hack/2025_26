import 'package:geoguessur_test/screens/about_screen.dart';
import 'package:geoguessur_test/screens/home_screen.dart';
import 'package:geoguessur_test/screens/setting_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: 'about',
      path: '/about',
      builder: (context, state) => const AboutScreen(),
    ),
    GoRoute(
      name: 'setting',
      path: '/setting',
      builder: (context, state) => const SettingScreen(),
    ),
  ],
);
