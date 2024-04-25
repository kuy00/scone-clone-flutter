import 'package:flutter/material.dart';
import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/view_model/plan_list_view_model.dart';
import 'package:go_router/go_router.dart';

class AddHistoryPage extends StatelessWidget {
  final String planId;

  // TODO : API 호출하여 상세 데이터 조회
  final PlanEntity plan = PlanListViewModel().plans[0];

  AddHistoryPage({super.key, required this.planId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            const Text(
              '내역 추가',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 2,
            ),
            Text('${plan.icon} ${plan.name}',
                style: const TextStyle(fontSize: 10)),
          ],
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
            size: 17,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: Center(child: Text('add history - $planId')),
    );
  }
}
