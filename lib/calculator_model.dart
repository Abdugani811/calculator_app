import 'package:flutter/material.dart';

enum Operation { division, multiplication, substraction, addition }

class Calculator with ChangeNotifier {
  double _previousNumber = 0;
  double _number = 0;
  Operation? _operation;
  bool _isDotTapped = false;

  // dark mode
  bool _isDarkModeOn = false;

  bool get isDarkModeOn => _isDarkModeOn;

  void changeIsDarkMode() {
    _isDarkModeOn = !_isDarkModeOn;
    notifyListeners();
  }

  // tugashi

  String get number {
    String numberStr = _number.toString();

    if (_number >= 1000) {
      numberStr = numberStr.replaceAllMapped(
        RegExp(r'\B(?=(\d{3})+(?!\d))'),
        (match) => ',',
      );
    }

    if (!_isDotTapped && numberStr.contains('.') && numberStr.endsWith('.0')) {
      numberStr = numberStr.substring(0, numberStr.indexOf('.'));
    }

    if (_isDotTapped && numberStr[numberStr.length - 1] == 0.toString()) {
      numberStr = numberStr.substring(0, numberStr.length - 1);
    }

    return numberStr;
  }

  void clear() {
    _previousNumber = 0;
    _number = 0;
    _operation = null;
    _isDotTapped = false;

    notifyListeners();
  }

  void onSignChange() {
    _number = -_number;
    notifyListeners();
  }

  void onTapPercent() {
    _number = _number / 100;
    notifyListeners();
  }

  void onTapDot() {
    _isDotTapped = true;
    notifyListeners();
  }

  void onTapNumber(int num) {
    if (number.replaceAll('.', '').replaceAll('.', '').length < 9) {
      if (_operation != null) {
        _previousNumber = _number;
        _number = num.toDouble();
      } else {
        if (_isDotTapped) {
          _number = double.tryParse('$number$num') ?? _number;
        } else {
          _number = _number * 10 + num;
        }
      }
      notifyListeners();
    }
  }

  void onTapRemove() {
    if (_number == 0) return;

    String numberStr = _number.toString();

    if (_isDotTapped && numberStr.endsWith('.0')) {
      numberStr = numberStr.substring(0, numberStr.length - 2);
      _isDotTapped = false;
    } else if (_isDotTapped && !numberStr.endsWith('.0')) {
      numberStr = numberStr.substring(0, numberStr.length - 1);
    } else if (numberStr.length < 4) {
      numberStr = 0.toString();
    } else {
      numberStr = numberStr.substring(0, numberStr.length - 3);
    }
    _number = double.tryParse(numberStr) ?? _number;
    notifyListeners();
  }

  void onTapOperation(Operation operation) {
    _operation = operation;
  }

  void onTapEqual() {
    double result = 0;

    switch (_operation) {
      case Operation.division:
        result = _previousNumber / _number;
      case Operation.multiplication:
        result = _previousNumber * _number;
      case Operation.substraction:
        result = _previousNumber - _number;
      case Operation.addition:
        result = _previousNumber + _number;
      case null:
    }
    _number = result;
    _operation = null;
    notifyListeners();
  }
}
