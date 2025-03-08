import 'package:go_router/go_router.dart';
import 'package:languagemaker/ui/home.dart';
import 'package:languagemaker/ui/langpage.dart';
import 'package:languagemaker/ui/newlang.dart';
import 'package:languagemaker/ui/pages/newlang/soundsselect.dart';
import 'package:languagemaker/ui/pages/settings/credits.dart';
import 'package:languagemaker/ui/settings.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const MyHomePage(), routes: [
    GoRoute(
      path: 'langpage/:langname',
      builder: (context, state) => Langpage(state.pathParameters['langname']!),
    ),
    GoRoute(path: 'newlang', builder: (context, state) => newlang(), routes: [
      GoRoute(
        path: 'soundsselect/:langname',
        builder: (context, state) => soundsselect(
          state.pathParameters['langname']!,
        ),
      )
    ]),
    GoRoute(
        path: 'settings',
        builder: (context, state) => Settings(),
        routes: [GoRoute(path: 'credits',builder: (context, state) => Credits(),)])
  ]),
]);
