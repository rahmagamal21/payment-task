import 'package:flutter/material.dart';

class PaymentProvider with ChangeNotifier {
  int _selectedPaymentMethodIndex = 0;

  int get selectedPaymentMethodIndex => _selectedPaymentMethodIndex;

  void selectPaymentMethod(int index) {
    _selectedPaymentMethodIndex = index;
    notifyListeners(); 
  }
}
