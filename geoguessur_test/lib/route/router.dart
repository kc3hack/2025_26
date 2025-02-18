import 'package:geoguessur_test/screens/guessr/level_screen.dart';
import 'package:geoguessur_test/screens/guessr/quiz_screen.dart';
import 'package:geoguessur_test/screens/list/list_screen.dart';
import 'package:geoguessur_test/screens/home/detail_screen.dart';
import 'package:geoguessur_test/screens/home/home_screen.dart';
import 'package:geoguessur_test/screens/guessr/guessr_screen.dart';
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
          path: '/detail',
          builder: (context, state) => DetailScreen(),
        ),
      ],
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: 'list',
      path: '/list',
      builder: (context, state) => const ListScreen(),
    ),
    GoRoute(
      name: 'guessr',
      path: '/guessr',
      routes: [
        GoRoute(
          name: 'level',
          path: '/level',
          routes: [
            GoRoute(
              name: 'quiz',
              path: '/:level/quiz',
              builder:
                  (context, state) => QuizScreen(
                    level: int.parse(state.pathParameters['level']!),
                  ),
            ),
          ],
          builder: (context, state) => LevelScreen(),
        ),
      ],
      builder: (context, state) => const GuessrScreen(),
    ),
  ],
);
