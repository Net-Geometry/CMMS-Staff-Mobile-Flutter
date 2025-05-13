import 'package:cmms_staff_mobile_flutter/src/theme/theme.dart';
import 'package:flutter/material.dart';

/// Extension on [ElevatedButton] to provide consistent styling
/// with border radius of 8 and default color 0xFF00A572
extension PrimaryButton on ElevatedButton {
  static ElevatedButton style({
    required VoidCallback onPressed,
    required Widget child,
    Color backgroundColor = AppColor.primary,
    double borderRadius = 8.0,
    EdgeInsetsGeometry? padding,
    double? elevation,
    Size? minimumSize,
    TextStyle? textStyle,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
        elevation: elevation,
        padding: padding,
        minimumSize: minimumSize,
        textStyle: textStyle,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
      ),
      child: child,
    );
  }
}
