import 'package:flutter/material.dart';
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
              CustomTransitionPage(
                  child: AddHistoryPage(
                    planId: state.pathParameters['id']!,
                  ),
                  transitionsBuilder: (
                    BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child,
                  ) =>
                      SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: const Offset(1.25, 0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.easeIn)),
                        ),
                        child: child,
                      )),
        )
      ],
    ),
  ],
);
