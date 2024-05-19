import 'package:flutter/material.dart';
import 'package:flutter_study/view_model/add_history_view_model.dart';
import 'package:provider/provider.dart';

class PlanHistoryTypeButtonWidget extends StatelessWidget {
  const PlanHistoryTypeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<AddHistoryViewModel>().setConsumption(),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: const Color(0xFFF6F6F6),
        surfaceTintColor: const Color(0xFFF6F6F6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        shadowColor: Colors.transparent,
        minimumSize: const Size(50, 50),
        padding: const EdgeInsets.all(0),
      ),
      child: context.watch<AddHistoryViewModel>().isConsumption
          ? const Icon(Icons.remove)
          : const Icon(
              Icons.add,
              color: Colors.green,
            ),
    );
  }
}
