import 'package:geoguessur_test/screens/guessr/level_screen.dart';
import 'package:geoguessur_test/screens/guessr/quiz_screen.dart';
import 'package:geoguessur_test/screens/guessr/result_screen.dart';
import 'package:geoguessur_test/screens/list/list_screen.dart';
import 'package:geoguessur_test/screens/home/detail_screen.dart';
import 'package:geoguessur_test/screens/home/home_screen.dart';
import 'package:geoguessur_test/screens/guessr/guessr_screen.dart';
import 'package:geoguessur_test/screens/list/result_keyword_search.dart';
import 'package:geoguessur_test/screens/list/result_tag_search.dart';
import 'package:geoguessur_test/component/button/search_page.dart';
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
      routes: [
        //タグルート
        GoRoute(
          name: 'resultTags',
          path: '/resultTags',
          builder: (context, state) {
            final map = state.uri.queryParameters;
            String regionTagsStr = map['regionTagsStr']!;
            String categoryTagsStr = map['categoryTagsStr']!;
            String eraTagsStr = map['eraTagsStr']!;
            return ResultTagSearch(
              regionTagsStr: regionTagsStr,
              categoryTagsStr: categoryTagsStr,
              eraTagsStr: eraTagsStr,
            );
          },
        ),
        //キーワードルート
        GoRoute(
          name: 'resultKeywords',
          path: '/resultKeywords',
          builder: (context, state) {
            final map = state.uri.queryParameters;
            String searchWords = map['searchWords']!;
            return ResultKeywordSearch(searchWords: searchWords);
          },
        ),
      ],
    ),

    //ゲッサールート
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
              routes: [
                GoRoute(
                  name: 'result',
                  path: '/result',
                  builder:
                      (context, state) => ResultScreen(Location: state.extra),
                ),
              ],
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
