import 'package:flutter/foundation.dart';

class NetIncomeProvider with ChangeNotifier {
  int totalBudget = 0;

  void getBudget(String netBudget) {
    totalBudget = int.tryParse(netBudget)!;
    notifyListeners();
  }

  void setBudget() {
    totalBudget = 6000;
    notifyListeners();
  }
}
