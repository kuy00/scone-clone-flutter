import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarWidget extends AppBar {
  AppBarWidget(BuildContext context, {super.key})
      : super(
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
              size: 17,
            ),
            onPressed: () => context.pop(),
          ),
          actions: [
            IconButton(
              onPressed: () => context.pop(),
              icon: const Text('취소'),
            ),
          ],
        );
}
