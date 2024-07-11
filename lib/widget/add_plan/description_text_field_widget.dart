import 'package:flutter/material.dart';
import 'package:flutter_study/view_model/add_plan_view_model.dart';
import 'package:flutter_study/widget/text_field_widget.dart';
import 'package:provider/provider.dart';

class DescriptionTextFieldWidget extends StatelessWidget {
  const DescriptionTextFieldWidget({super.key});

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
        controller: context.read<AddPlanViewModel>().descriptionTextController,
        focusNode:
            context.read<AddPlanViewModel>().descriptionTextFieldFocusNode,
        prefix: const Row(
          children: [
            Icon(
              Icons.view_headline,
              color: Color(0xFFC4C4C4),
            ),
            SizedBox(
              width: 8,
            ),
          ],
        ),
        inputDecoration: InputDecoration(
          hintText: '설명 (선택)',
          border: InputBorder.none,
          hintStyle: const TextStyle(fontWeight: FontWeight.normal),
          suffixIcon: context
                  .watch<AddPlanViewModel>()
                  .isDescriptionFieldDeleteIconVisible
              ? GestureDetector(
                  onTap: () => context
                      .read<AddPlanViewModel>()
                      .descriptionTextController
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
