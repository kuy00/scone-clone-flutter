import 'package:flutter/cupertino.dart';
import 'package:flutter_study/view_model/plan_list_view_model.dart';
import '../entity/plan_entity.dart';

class AddHistoryViewModel extends ChangeNotifier {
  final String planId;
  late PlanEntity plan;
  final TextEditingController _priceTextController = TextEditingController();
  String _emoji = '😀';
  bool _isEmojiPickerVisible = false;
  DateTime _date = DateTime.now();

  AddHistoryViewModel(this.planId) {
    getPlan();
  }

  TextEditingController get priceTextController => _priceTextController;
  bool get isEmojiPickerVisible => _isEmojiPickerVisible;
  String get emoji => _emoji;
  DateTime get date => _date;

  void getPlan() {
    // TODO : API 호출하여 상세 데이터 조회
    plan = PlanListViewModel().plans[0];
  }

  void setEmoji(String emoji) {
    _emoji = emoji;
    notifyListeners();
  }

  void setEmojiPickerVisible() {
    _isEmojiPickerVisible = !_isEmojiPickerVisible;
    notifyListeners();
  }

  void setDate(DateTime date) {
    _date = date;
    notifyListeners();
  }
}
