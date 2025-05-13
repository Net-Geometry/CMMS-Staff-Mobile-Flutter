import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class AppTextStyle extends TextStyle {
  static final String _fontFamily = GoogleFonts.inter().fontFamily!;
  final double? size;

  AppTextStyle({this.size}) : super(fontFamily: _fontFamily, fontSize: size);
}

/// Make sure you call the font types before overriding the weight and colors
extension AppTextStyleExtension on Text {
  Text get headlineLarge => Text(data ?? '', style: AppTextStyle(size: 32));
  Text get headlineMedium => Text(data ?? '', style: AppTextStyle(size: 28));
  Text get headlineSmall => Text(data ?? '', style: AppTextStyle(size: 24));

  Text get titleLarge => Text(data ?? '', style: AppTextStyle(size: 22));
  Text get titleMedium => Text(data ?? '', style: AppTextStyle(size: 18)).titleMedium;
  Text get titleSmall => Text(data ?? '', style: AppTextStyle(size: 14)).titleMedium;

  Text get bodyLarge => Text(data ?? '', style: AppTextStyle(size: 16));
  Text get bodyMedium => Text(data ?? '', style: AppTextStyle(size: 14));
  Text get bodySmall => Text(data ?? '', style: AppTextStyle(size: 12));

  Text get labelLarge => Text(data ?? '', style: AppTextStyle(size: 14)).medium;
  Text get labelMedium => Text(data ?? '', style: AppTextStyle(size: 12)).medium;
  Text get labelSmall => Text(data ?? '', style: AppTextStyle(size: 11)).medium;

  Text get regular => Text(data ?? '', style: style?.copyWith(fontWeight: FontWeight.w400));
  Text get medium => Text(data ?? '', style: style?.copyWith(fontWeight: FontWeight.w500));
  Text get semiBold => Text(data ?? '', style: style?.copyWith(fontWeight: FontWeight.w600));
  Text get bold => Text(data ?? '', style: style?.copyWith(fontWeight: FontWeight.w700));

  Text withColor(Color color) => Text(data ?? '', style: style?.copyWith(color: color));
  Text get white => withColor(Colors.white);
  Text get black => withColor(Colors.black);
  Text get black54 => withColor(Colors.black54);
  Text get black87 => withColor(Colors.black87);
  Text get error => withColor(AppColor.error);
  Text get primary => withColor(AppColor.primary);
  Text get paleSlate => withColor(AppColor.paleSlate);
  Text get charcoalGray => withColor(AppColor.charcoalGray);
}
