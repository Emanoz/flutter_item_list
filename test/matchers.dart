import 'package:flutter/material.dart';

bool textFieldMatcher(Widget widget, String labelText) {
  if (widget is TextField) return widget.decoration.labelText == labelText;
  return false;
}
