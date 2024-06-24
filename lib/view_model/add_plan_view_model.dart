import 'package:flutter/cupertino.dart';

class AddPlanViewModel extends ChangeNotifier {
  DateTime? _startDate;
  DateTime? _endDate;
  final TextEditingController _priceTextController = TextEditingController();
  String _displayPrice = '';
  bool _isPriceFieldDeleteIconVisible = false;

  AddPlanViewModel() {
    _priceTextController.addListener(() => _onTextFieldChanged());
  }

  void _onTextFieldChanged() {
    setDisplayPrice(_priceTextController.text);
    _isPriceFieldDeleteIconVisible = _priceTextController.text.isNotEmpty;
  }

  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;
  TextEditingController get priceTextController => _priceTextController;
  String? get displayPrice => _displayPrice;
  bool get isPriceFieldDeleteIconVisible => _isPriceFieldDeleteIconVisible;

  void setStartDate(DateTime date) {
    _startDate = date;
    notifyListeners();
  }

  void setEndDate(DateTime date) {
    _endDate = date;
    notifyListeners();
  }

  void setDisplayPrice(String price) {
    _displayPrice = price;
    notifyListeners();
  }
}
