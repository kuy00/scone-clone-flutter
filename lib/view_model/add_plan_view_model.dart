import 'dart:math';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_study/database/database.dart';
import 'package:flutter_study/database/repository/plan_repository.dart';
import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/enum/plan_type.dart';
import 'package:flutter_study/util/datetime_util.dart';
import 'package:jiffy/jiffy.dart';

class AddPlanViewModel extends ChangeNotifier {
  final PlanRepository planRepository = PlanRepository(Database().planDao);
  List<DateTime>? _selectedDate;
  final TextEditingController _priceTextController = TextEditingController();
  final TextEditingController _planNameTextController = TextEditingController();
  final TextEditingController _descriptionTextController =
      TextEditingController();
  String _displayPrice = '';
  bool _isPriceFieldDeleteIconVisible = false;
  bool _isPlanNameFieldDeleteIconVisible = false;
  bool _isDescriptionFieldDeleteIconVisible = false;
  final String _emoji = defaultEmojiSet[2]
      .emoji[Random().nextInt(defaultEmojiSet[2].emoji.length)]
      .emoji
      .toString();

  AddPlanViewModel() {
    _priceTextController.addListener(() => _onTextFieldChanged('price'));
    _planNameTextController.addListener(() => _onTextFieldChanged('planName'));
    _descriptionTextController
        .addListener(() => _onTextFieldChanged('description'));
  }

  void _onTextFieldChanged(String field) {
    switch (field) {
      case 'price':
        setDisplayPrice(_priceTextController.text);
        _isPriceFieldDeleteIconVisible = _priceTextController.text.isNotEmpty;
        break;
      case 'planName':
        _isPlanNameFieldDeleteIconVisible =
            _planNameTextController.text.isNotEmpty;
      case 'description':
        _isDescriptionFieldDeleteIconVisible =
            _descriptionTextController.text.isNotEmpty;
    }

    notifyListeners();
  }

  List<DateTime>? get selectedDate => _selectedDate;
  TextEditingController get priceTextController => _priceTextController;
  TextEditingController get planNameTextController => _planNameTextController;
  TextEditingController get descriptionTextController =>
      _descriptionTextController;
  String? get displayPrice => _displayPrice;
  bool get isPriceFieldDeleteIconVisible => _isPriceFieldDeleteIconVisible;
  bool get isPlanNameFieldDeleteIconVisible =>
      _isPlanNameFieldDeleteIconVisible;
  bool get isDescriptionFieldDeleteIconVisible =>
      _isDescriptionFieldDeleteIconVisible;
  int get dateRange =>
      dateDiff(selectedDate!.first, selectedDate!.last, unit: Unit.day) + 1;
  bool get isFirstStepInvalid =>
      _priceTextController.text.isNotEmpty && _selectedDate != null;
  bool get isSecondStepInvalid => _planNameTextController.text.isNotEmpty;
  String get emoji => _emoji;

  void setSelectedDate(List<DateTime> dateList) {
    _selectedDate = dateList;
    notifyListeners();
  }

  void setDisplayPrice(String price) {
    _displayPrice = price;
    notifyListeners();
  }

  void clearSecondPage() {
    _planNameTextController.clear();
    _descriptionTextController.clear();
  }

  void addPlan() async {
    PlanEntity planEntity = PlanEntity(
      startDate: _selectedDate!.first,
      endDate: _selectedDate!.last,
      type: PlanType.plan, // TODO : 플랜 타입 구분 필요
      name: _planNameTextController.text,
      memo: _descriptionTextController.text,
      icon: emoji,
      planHistory: [],
      totalAmount: int.parse(_priceTextController.text.replaceAll(',', '')),
    );

    // TODO : 추가된 플랜 재조회 방식 확인 필요
    await PlanRepository(Database().planDao).createPlan(planEntity);
  }

  @override
  void dispose() {
    _priceTextController.dispose();
    _planNameTextController.dispose();
    _descriptionTextController.dispose();

    super.dispose();
  }
}
