import 'package:flutter/foundation.dart';

class NetIncomeProvider with ChangeNotifier {
  int _totalBudget = 0;

  int get totalBudget => _totalBudget;

  void getBudget(int netBudget) {
    _totalBudget = netBudget;
    notifyListeners();
  }

}
