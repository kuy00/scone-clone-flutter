import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/view_model/add_history_view_model.dart';
import 'package:flutter_study/widget/text_field_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ContentTextFieldWidget extends StatelessWidget {
  const ContentTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      inputDecoration: InputDecoration(
        hintText: '내용',
        hintStyle: const TextStyle(color: Color(0xFFBEBEBE)),
        border: InputBorder.none,
        suffixIcon:
            context.watch<AddHistoryViewModel>().isContentFieldDeleteIconVisible
                ? GestureDetector(
                    onTap: () => context
                        .read<AddHistoryViewModel>()
                        .contentTextController
                        .clear(),
                    child: const Icon(
                      Icons.cancel,
                      color: Color(0xFFC4C4C4),
                      size: 20,
                    ),
                  )
                : null,
      ),
      controller: context.read<AddHistoryViewModel>().contentTextController,
      focusNode: context.read<AddHistoryViewModel>().contentTextFieldFocusNode,
      prefix: GestureDetector(
        onTap: () => showModalBottomSheet(
          showDragHandle: false,
          isScrollControlled: true,
          context: context,
          builder: (_) {
            // TODO : 이미지 피커 스타일 수정
            return EmojiPicker(
              onEmojiSelected: (category, emoji) {
                context
                    .read<AddHistoryViewModel>()
                    .setEmoji(emoji.emoji.toString());
                context.pop();
              },
            );
          },
        ),
        child: Container(
          margin: const EdgeInsets.only(right: 8),
          child: Text(context.watch<AddHistoryViewModel>().emoji),
        ),
      ),
    );
  }
}
