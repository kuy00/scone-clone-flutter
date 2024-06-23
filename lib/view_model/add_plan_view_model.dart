import 'package:flutter/cupertino.dart';

class AddPlanViewModel extends ChangeNotifier {
  List<DateTime>? _date;
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

  List<DateTime>? get date => _date;
  TextEditingController get priceTextController => _priceTextController;
  String? get displayPrice => _displayPrice;
  bool get isPriceFieldDeleteIconVisible => _isPriceFieldDeleteIconVisible;

  void setDate(List<DateTime> date) {
    _date = date;
    notifyListeners();
  }

  void setDisplayPrice(String price) {
    _displayPrice = price;
    notifyListeners();
  }
}
