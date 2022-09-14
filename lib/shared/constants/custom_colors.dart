import 'package:flutter/material.dart';

class CustomColors {
  final Color _activePrimaryButton = const Color.fromARGB(255, 32, 151, 248);
  final Color _activeSecondaryButton = const Color.fromARGB(12, 32, 151, 248);
  final Color _gradientTopColor = const Color(0xFF0B2345);
  final Color _gradientBottomColor = const Color(0xFF0E1621);
  final Color _gradientBluePrimary = const Color.fromARGB(255, 32, 151, 248);
  final Color _cardBackgroundColor = const Color(0xFF173156);

  Color getActivePrimaryButtonColor() {
    return _activePrimaryButton;
  }

  Color getActiveSecondaryButtonColor() {
    return _activeSecondaryButton;
  }

  Color getGradientTopColor() {
    return _gradientTopColor;
  }

  Color getGradientBottomColor() {
    return _gradientBottomColor;
  }

  Color getGradientBluePrimary() {
    return _gradientBluePrimary;
  }

  Color getCardBackgroundColor() {
    return _cardBackgroundColor;
  }
}
