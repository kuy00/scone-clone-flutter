import 'package:flutter/material.dart';
import 'package:flutter_study/util/text_input_formatter.dart';
import 'package:flutter_study/view_model/add_plan_view_model.dart';
import 'package:flutter_study/widget/text_field_widget.dart';
import 'package:provider/provider.dart';

class PriceTextFieldWidget extends StatelessWidget {
  const PriceTextFieldWidget({super.key});

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
        controller: context.read<AddPlanViewModel>().priceTextController,
        focusNode: context.read<AddPlanViewModel>().priceTextFieldFocusNode,
        prefix: const Row(
          children: [
            Icon(
              Icons.monetization_on_sharp,
              color: Color(0xFFC4C4C4),
            ),
            SizedBox(
              width: 8,
            ),
          ],
        ),
        inputDecoration: InputDecoration(
          hintText: '예산',
          border: InputBorder.none,
          hintStyle: const TextStyle(fontWeight: FontWeight.normal),
          suffixIcon:
              context.watch<AddPlanViewModel>().isPriceFieldDeleteIconVisible
                  ? GestureDetector(
                      onTap: () => context
                          .read<AddPlanViewModel>()
                          .priceTextController
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
        inputFormatters: [
          CurrencyInputFormatter(),
        ],
        keyboardType: TextInputType.number,
        suffix: const Text(
          '원',
          style: TextStyle(
            color: Color(0xFF828282),
          ),
        ),
      ),
    );
  }
}
