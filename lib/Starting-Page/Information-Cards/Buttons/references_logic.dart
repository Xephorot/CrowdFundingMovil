// references_logic.dart
import 'package:flutter/material.dart';

class ReferencesLogic {
  bool _showReferences = false;

  bool get showReferences => _showReferences;

  void toggleReferences() {
    _showReferences = !_showReferences;
  }

  List<Widget> filterEntries(Map data) {
    final referencesKeys = ['email', 'tel', 'nombre_completo'];
    return data.entries.where((entry) {
      return _showReferences ? referencesKeys.contains(entry.key) : !referencesKeys.contains(entry.key);
    }).map((entry) {
      String key = entry.key.replaceAll('_', ' ');
      key = '${key[0].toUpperCase()}${key.substring(1)}';
      return Text('$key: ${entry.value}');
    }).toList();
  }
}
