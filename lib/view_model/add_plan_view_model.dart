import 'dart:math';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_study/database/repository/plan_repository.dart';
import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/enum/plan_type.dart';
import 'package:flutter_study/util/datetime_util.dart';
import 'package:get_it/get_it.dart';
import 'package:jiffy/jiffy.dart';

class AddPlanViewModel extends ChangeNotifier {
  final PlanRepository planRepository = GetIt.I<PlanRepository>();
  List<DateTime>? _selectedDate;
  final TextEditingController _priceTextController = TextEditingController();
  final TextEditingController _planNameTextController = TextEditingController();
  final TextEditingController _descriptionTextController =
      TextEditingController();
  final FocusNode _priceTextFieldFocusNode = FocusNode();
  final FocusNode _planNameTextFieldFocusNode = FocusNode();
  final FocusNode _descriptionTextFieldFocusNode = FocusNode();
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

    _priceTextFieldFocusNode.addListener(_onFocusChanged);
    _planNameTextFieldFocusNode.addListener(_onFocusChanged);
    _descriptionTextFieldFocusNode.addListener(_onFocusChanged);
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
        break;
      case 'description':
        _isDescriptionFieldDeleteIconVisible =
            _descriptionTextController.text.isNotEmpty;
        break;
    }

    notifyListeners();
  }

  void _onFocusChanged() {
    if (_priceTextFieldFocusNode.hasFocus) {
      _isPriceFieldDeleteIconVisible = _priceTextController.text.isNotEmpty;
    } else if (_planNameTextFieldFocusNode.hasFocus) {
      _isDescriptionFieldDeleteIconVisible = false;
      _isPlanNameFieldDeleteIconVisible = _priceTextController.text.isNotEmpty;
    } else if (_descriptionTextFieldFocusNode.hasFocus) {
      _isPlanNameFieldDeleteIconVisible = false;
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
  FocusNode get priceTextFieldFocusNode => _priceTextFieldFocusNode;
  FocusNode get planNameTextFieldFocusNode => _planNameTextFieldFocusNode;
  FocusNode get descriptionTextFieldFocusNode => _descriptionTextFieldFocusNode;
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

    await planRepository.createPlan(planEntity);
  }

  @override
  void dispose() {
    _priceTextController.dispose();
    _planNameTextController.dispose();
    _descriptionTextController.dispose();

    super.dispose();
  }
}
