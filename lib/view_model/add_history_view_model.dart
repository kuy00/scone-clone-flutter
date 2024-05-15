import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_study/view_model/plan_list_view_model.dart';
import '../entity/plan_entity.dart';

class AddHistoryViewModel extends ChangeNotifier {
  final String planId;
  late PlanEntity plan;
  final TextEditingController _priceTextController = TextEditingController();
  final TextEditingController _contentTextController = TextEditingController();
  String _emoji = '😀';
  bool _isEmojiPickerVisible = false;
  DateTime _date = DateTime.now();
  bool _isConsumption = true;
  bool _isPriceFieldDeleteIconVisible = false;
  bool _isContentFieldDeleteIconVisible = false;

  AddHistoryViewModel(this.planId) {
    getPlan();
  }

  TextEditingController get priceTextController => _priceTextController;
  TextEditingController get contentTextController => _contentTextController;
  bool get isEmojiPickerVisible => _isEmojiPickerVisible;
  String get emoji => _emoji;
  DateTime get date => _date;
  bool get isConsumption => _isConsumption;
  bool get isPriceFieldDeleteIconVisible => _isPriceFieldDeleteIconVisible;
  bool get isContentFieldDeleteIconVisible => _isContentFieldDeleteIconVisible;

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

  void setConsumption() {
    _isConsumption = !_isConsumption;
    notifyListeners();
  }

  void setPriceFieldDeleteIconVisible() {
    _isPriceFieldDeleteIconVisible = _priceTextController.text.isNotEmpty;
    notifyListeners();
  }

  void setContentFieldDeleteIconVisible() {
    _isContentFieldDeleteIconVisible = _contentTextController.text.isNotEmpty;
    notifyListeners();
  }
}
