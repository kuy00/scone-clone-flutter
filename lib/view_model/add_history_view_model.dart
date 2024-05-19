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
  final FocusNode _priceTextFieldFocusNode = FocusNode();
  final FocusNode _contentTextFieldFocusNode = FocusNode();
  String _emoji = '😀';
  DateTime _date = DateTime.now();
  bool _isConsumption = true;
  bool _isPriceFieldDeleteIconVisible = false;
  bool _isContentFieldDeleteIconVisible = false;

  AddHistoryViewModel(this.planId) {
    _priceTextController.addListener(() => _onTextFieldChanged('price'));
    _contentTextController.addListener(() => _onTextFieldChanged('content'));

    _priceTextFieldFocusNode.addListener(_onFocusChanged);
    _contentTextFieldFocusNode.addListener(_onFocusChanged);

    getPlan();
  }

  void _onTextFieldChanged(String key) {
    if (key == 'price') {
      _isPriceFieldDeleteIconVisible = _priceTextController.text.isNotEmpty;
    } else if (key == 'content') {
      _isContentFieldDeleteIconVisible = _contentTextController.text.isNotEmpty;
    }

    notifyListeners();
  }

  void _onFocusChanged() {
    if (_priceTextFieldFocusNode.hasFocus) {
      _isContentFieldDeleteIconVisible = false;
      _isPriceFieldDeleteIconVisible = _priceTextController.text.isNotEmpty;
    } else if (_contentTextFieldFocusNode.hasFocus) {
      _isPriceFieldDeleteIconVisible = false;
      _isContentFieldDeleteIconVisible = _contentTextController.text.isNotEmpty;
    }

    notifyListeners();
  }

  void getPlan() {
    // TODO : API 호출하여 상세 데이터 조회
    plan = PlanListViewModel().plans[0];
  }

  TextEditingController get priceTextController => _priceTextController;
  TextEditingController get contentTextController => _contentTextController;
  FocusNode get priceTextFieldFocusNode => _priceTextFieldFocusNode;
  FocusNode get contentTextFieldFocusNode => _contentTextFieldFocusNode;
  String get emoji => _emoji;
  DateTime get date => _date;
  bool get isConsumption => _isConsumption;
  bool get isPriceFieldDeleteIconVisible => _isPriceFieldDeleteIconVisible;
  bool get isContentFieldDeleteIconVisible => _isContentFieldDeleteIconVisible;

  void setEmoji(String emoji) {
    _emoji = emoji;
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
