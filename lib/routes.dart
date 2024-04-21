import 'package:flutter/material.dart';
import 'package:flutter_study/page/add_plan_page.dart';
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
          path: 'addPlan',
          builder: (BuildContext context, GoRouterState state) {
            return const AddPlanPage();
          },
        )
      ],
    ),
  ],
);
