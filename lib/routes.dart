import 'package:flutter/cupertino.dart';
import 'package:flutter_study/enum/plan_type.dart';
import 'package:flutter_study/page/add_history_page.dart';
import 'package:flutter_study/page/add_plan_complete_page.dart';
import 'package:flutter_study/page/add_plan_first_step_page.dart';
import 'package:flutter_study/page/add_plan_page.dart';
import 'package:flutter_study/page/add_plan_second_step_page.dart';
import 'package:flutter_study/page/home_page.dart';
import 'package:flutter_study/view_model/add_plan_view_model.dart';
import 'package:go_router/go_router.dart';

final GoRouter routes = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),
    GoRoute(
      path: '/plan/:id/addHistory',
      pageBuilder: (BuildContext context, GoRouterState state) => CupertinoPage(
        child: AddHistoryPage(
          planId: int.parse(state.pathParameters['id']!),
        ),
      ),
    ),
    GoRoute(
      path: '/addPlan',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          const CupertinoPage(
        child: AddPlanPage(),
      ),
      routes: <RouteBase>[
        GoRoute(
          path: 'firstStep',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              CupertinoPage(
            child: AddPlanFirstStepPage(
              planType: state.extra as PlanType,
            ),
          ),
        ),
        GoRoute(
          path: 'secondStep',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              CupertinoPage(
            child: AddPlanSecondStepPage(
              viewModel: state.extra as AddPlanViewModel,
            ),
          ),
        ),
        GoRoute(
          path: 'complete',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              CupertinoPage(
            child: AddPlanCompletePage(
              viewModel: state.extra as AddPlanViewModel,
            ),
          ),
        ),
      ],
    ),
  ],
);
