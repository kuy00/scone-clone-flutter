import 'package:flutter/material.dart';
import 'package:flutter_study/util/text_input_formatter.dart';
import 'package:flutter_study/view_model/add_history_view_model.dart';
import 'package:flutter_study/widget/text_field_widget.dart';
import 'package:provider/provider.dart';

class PriceTextFieldWidget extends StatelessWidget {
  const PriceTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      controller: context.read<AddHistoryViewModel>().priceTextController,
      focusNode: context.read<AddHistoryViewModel>().priceTextFieldFocusNode,
      inputDecoration: InputDecoration(
        hintText: context.watch<AddHistoryViewModel>().isConsumption
            ? '소비 금액'
            : '수입 금액',
        hintStyle: const TextStyle(color: Color(0xFFBEBEBE)),
        border: InputBorder.none,
        suffixIcon:
            context.watch<AddHistoryViewModel>().isPriceFieldDeleteIconVisible
                ? GestureDetector(
                    onTap: () => context
                        .read<AddHistoryViewModel>()
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
      suffix: const Text(
        '원',
        style: TextStyle(
          color: Color(0xFF828282),
        ),
      ),
      inputFormatters: [
        CurrencyInputFormatter(),
      ],
      keyboardType: TextInputType.number,
    );
  }
}
