import 'package:flutter/material.dart';

class CustomColors {
  Color _ActivePrimaryButton = Color.fromARGB(255, 32, 151, 248);
  Color _ActiveSecondaryButton = Color.fromARGB(12, 32, 151, 248);
  Color _gradientTopColor = Color(0xFF0B2345);
  Color _gradientBottomColor = Color(0xFF0E1621);
  Color _gradientBluePrimary = Color.fromARGB(255, 32, 151, 248);

  Color getActivePrimaryButtonColor() {
    return _ActivePrimaryButton;
  }

  Color getActiveSecondaryButtonColor() {
    return _ActiveSecondaryButton;
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
}
