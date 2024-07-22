import 'package:flutter/material.dart';
import 'package:flutter_study/widget/button_widget.dart';
import 'package:go_router/go_router.dart';

class EmptyPlan extends StatelessWidget {
  const EmptyPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '나는 소비한다, 고로 존재한다.',
            style: TextStyle(color: Color(0xFF807F7F), fontSize: 13),
          ),
          const Text(
            '당신은 어떤 소비를 하고 있을까요?',
            style: TextStyle(color: Color(0xFF807F7F), fontSize: 13),
          ),
          const SizedBox(
            height: 30,
          ),
          ButtonWidget(
            onPressed: () => context.go('/addPlan'),
            text: '플랜 만들기',
            size: const Size(100, 35),
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
    );
  }
}
