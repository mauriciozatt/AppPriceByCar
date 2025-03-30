import 'package:flutter/material.dart';

class LoadingManager {
  final ValueNotifier<bool> _isLoanding = ValueNotifier(false);

  ValueNotifier<bool> get isLoanding => _isLoanding;

  void setLoanding(bool value) {
    _isLoanding.value = value;
  }

  void dispose() {
    _isLoanding.dispose();
  }
}
