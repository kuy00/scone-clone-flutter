import 'dart:math';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_study/database/repository/plan_history_repository.dart';
import 'package:flutter_study/database/repository/plan_repository.dart';
import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/entity/plan_history_entity.dart';
import 'package:flutter_study/enum/plan_history_type.dart';
import 'package:flutter_study/util/number_util.dart';
import 'package:get_it/get_it.dart';

class AddHistoryViewModel extends ChangeNotifier {
  final PlanRepository planRepository = GetIt.I<PlanRepository>();
  final PlanHistoryRepository planHistoryRepository =
      GetIt.I<PlanHistoryRepository>();

  final int planId;
  late PlanEntity plan;
  late List<PlanHistoryEntity> _planHistories;
  final TextEditingController _priceTextController = TextEditingController();
  final TextEditingController _contentTextController = TextEditingController();
  final FocusNode _priceTextFieldFocusNode = FocusNode();
  final FocusNode _contentTextFieldFocusNode = FocusNode();
  String _emoji = defaultEmojiSet[2]
      .emoji[Random().nextInt(defaultEmojiSet[2].emoji.length)]
      .emoji
      .toString();
  DateTime _date = DateTime.now();
  bool _isConsumption = true;
  bool _isPriceFieldDeleteIconVisible = false;
  bool _isContentFieldDeleteIconVisible = false;
  bool _isPlanInitialized = false;

  AddHistoryViewModel(this.planId) {
    _priceTextController.addListener(() => _onTextFieldChanged('price'));
    _contentTextController.addListener(() => _onTextFieldChanged('content'));

    _priceTextFieldFocusNode.addListener(_onFocusChanged);
    _contentTextFieldFocusNode.addListener(_onFocusChanged);
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

  void getPlan() async {
    plan = await planRepository.getPlan(planId);
    _isPlanInitialized = true;
    notifyListeners();
  }

  void getPlanHistory() async {
    _planHistories = await planHistoryRepository.getPlanHistoryByPlanId(planId);
    notifyListeners();
  }

  void init() {
    getPlan();
    getPlanHistory();
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
  bool get isPlanInitialized => _isPlanInitialized;
  List<PlanHistoryEntity> get planHistories => _planHistories;

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

  void setHistoryData(PlanHistoryEntity planHistory) {
    _isConsumption = planHistory.type == PlanHistoryType.consumption;
    _emoji = planHistory.icon;
    _priceTextController.text = currencyFormat(planHistory.amount);
    _contentTextController.text = planHistory.memo;
    _date = planHistory.date;

    notifyListeners();
  }

  PlanHistoryEntity get toPlanHistoryEntity {
    PlanHistoryEntity planHistoryEntity = PlanHistoryEntity(
      planId: planId,
      icon: _emoji,
      type:
          _isConsumption ? PlanHistoryType.consumption : PlanHistoryType.income,
      amount: int.parse(_priceTextController.text.replaceAll(',', '')),
      memo: _contentTextController.text,
      date: _date,
    );

    planHistoryRepository.createPlanHistory(planHistoryEntity);

    return planHistoryEntity;
  }

  @override
  void dispose() {
    _priceTextController.dispose();
    _contentTextController.dispose();
    _priceTextFieldFocusNode.dispose();
    _contentTextFieldFocusNode.dispose();

    super.dispose();
  }
}
