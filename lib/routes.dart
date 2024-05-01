import 'package:flutter/cupertino.dart';
import 'package:flutter_study/page/add_history_page.dart';
import 'package:flutter_study/page/home_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter routes = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
            path: 'plan/:id/addHistory',
            pageBuilder: (BuildContext context, GoRouterState state) =>
                CupertinoPage(
                    child: AddHistoryPage(
                  planId: state.pathParameters['id']!,
                )))
      ],
    ),
  ],
);
