import 'package:geoguessur_test/screens/about_screen.dart';
import 'package:geoguessur_test/screens/detail_screen.dart';
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
      routes: [
        GoRoute(
          name: 'detail',
          path: 'detail/:user_name/:user_id',
          builder: (context, state) {
            final userName = state.pathParameters['user_name'];
            final userId = state.pathParameters['user_id'];
            return DetailScreen(
              userName: userName!,
              userId: int.parse(userId!),
            );
          },
        ),
      ],
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
