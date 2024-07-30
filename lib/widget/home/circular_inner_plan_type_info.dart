import 'package:flutter/material.dart';
import 'package:flutter_study/util/number_util.dart';

class CircularInnerPlanTypeInfo extends StatelessWidget {
  final int remainAmount;
  final int totalAmount;

  const CircularInnerPlanTypeInfo(
      {super.key, required this.remainAmount, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: remainAmount > 0,
          child: const Text(
            '남은 예산',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10,
            ),
          ),
        ),
        Visibility(
          visible: remainAmount < 0,
          child: const Text(
            '초과됨',
            style: TextStyle(
              color: Colors.red,
              fontSize: 10,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${currencyFormat(remainAmount)}원',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 12,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          '/ ${currencyFormat(totalAmount)}원',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
