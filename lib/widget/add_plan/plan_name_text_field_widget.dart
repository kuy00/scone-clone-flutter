import 'package:flutter/material.dart';
import 'package:flutter_study/view_model/add_plan_view_model.dart';
import 'package:flutter_study/widget/text_field_widget.dart';
import 'package:provider/provider.dart';

class PlanNameTextFieldWidget extends StatelessWidget {
  const PlanNameTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextFieldWidget(
        controller: context.read<AddPlanViewModel>().planNameTextController,
        prefix: const Row(
          children: [
            Icon(
              Icons.book,
              color: Color(0xFFC4C4C4),
            ),
            SizedBox(
              width: 8,
            ),
          ],
        ),
        inputDecoration: InputDecoration(
          hintText: '플랜 이름',
          border: InputBorder.none,
          hintStyle: const TextStyle(fontWeight: FontWeight.normal),
          suffixIcon:
              context.watch<AddPlanViewModel>().isPlanNameFieldDeleteIconVisible
                  ? GestureDetector(
                      onTap: () => context
                          .read<AddPlanViewModel>()
                          .planNameTextController
                          .clear(),
                      child: const Icon(
                        Icons.cancel,
                        color: Color(0xFFC4C4C4),
                        size: 20,
                      ),
                    )
                  : null,
        ),
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }
}
