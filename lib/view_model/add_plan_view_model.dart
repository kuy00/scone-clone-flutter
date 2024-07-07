import 'package:flutter/cupertino.dart';
import 'package:flutter_study/util/datetime_util.dart';
import 'package:jiffy/jiffy.dart';

class AddPlanViewModel extends ChangeNotifier {
  List<DateTime>? _selectedDate;
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

  List<DateTime>? get selectedDate => _selectedDate;
  TextEditingController get priceTextController => _priceTextController;
  String? get displayPrice => _displayPrice;
  bool get isPriceFieldDeleteIconVisible => _isPriceFieldDeleteIconVisible;
  int get dateRange =>
      dateDiff(selectedDate!.first, selectedDate!.last, unit: Unit.day)
          .toInt() +
      1;

  void setSelectedDate(List<DateTime> dateList) {
    _selectedDate = dateList;
    notifyListeners();
  }

  void setDisplayPrice(String price) {
    _displayPrice = price;
    notifyListeners();
  }

  @override
  void dispose() {
    _priceTextController.dispose();

    super.dispose();
  }
}
