import 'package:flutter/material.dart';

class Category {
  final IconData _icon;  // Use 'final' since these are required and should not change after initialization
  final String _title; // Use 'final'
  final bool _selected; // Use 'final'

  // Constructor with required named parameters
  Category({
    required IconData icon,
    required String title,
    required bool selected,
  })  : _icon = icon,
        _title = title,
        _selected = selected;

  // Getters
  IconData get icon => _icon;
  String get title => _title;
  bool get selected => _selected;

}
