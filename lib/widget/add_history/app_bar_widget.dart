import 'package:flutter/material.dart';
import 'package:flutter_study/view_model/add_history_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppBarWidget extends AppBar {
  AppBarWidget(BuildContext context, {super.key})
      : super(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
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
              Text(
                  '${context.read<AddHistoryViewModel>().plan.icon} ${context.read<AddHistoryViewModel>().plan.name}',
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
        );
}
