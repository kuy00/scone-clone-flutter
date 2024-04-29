import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/view_model/plan_list_view_model.dart';
import 'package:flutter_study/widget/add_history_input_widget.dart';
import 'package:flutter_study/widget/text_field_widget.dart';
import 'package:go_router/go_router.dart';

class AddHistoryPage extends StatefulWidget {
  final String planId;

  // TODO : API 호출하여 상세 데이터 조회
  final PlanEntity plan = PlanListViewModel().plans[0];

  AddHistoryPage({super.key, required this.planId});

  @override
  State<StatefulWidget> createState() => _AddHistoryPageState();
}

class _AddHistoryPageState extends State<AddHistoryPage> {
  final TextEditingController _priceTextController = TextEditingController();
  bool _isEmojiPickerVisible = false;
  String _emoji = '😀';

  @override
  void dispose() {
    _priceTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
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
              Text('${widget.plan.icon} ${widget.plan.name}',
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
            // padding: EdgeInsets.only(left: 0),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  AddHistoryInputWidget(controller: _priceTextController),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    height: 50,
                    hintText: '내용',
                    hintStyle: const TextStyle(color: Color(0xFFBEBEBE)),
                    prefix: GestureDetector(
                      onTap: () => setState(() {
                        _isEmojiPickerVisible = !_isEmojiPickerVisible;
                      }),
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: Text(_emoji),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Offstage(
                  offstage: !_isEmojiPickerVisible,
                  // TODO : 이미지 피커 스타일 수정
                  child: EmojiPicker(
                    onEmojiSelected: (category, emoji) => setState(() {
                      _emoji = emoji.emoji.toString();
                      _isEmojiPickerVisible = !_isEmojiPickerVisible;
                    }),
                  ),
                ))
          ],
        ));
  }
}
