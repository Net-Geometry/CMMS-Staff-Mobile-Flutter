import 'package:cmms_staff_mobile_flutter/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FormApp extends StatelessWidget {
  const FormApp({
    super.key,
    this.controller,
    required this.title,
    this.hintText,
    this.prefixIcon,
    this.validator,
    this.suffixIcon,
    this.obscureText = false,
  });
  final TextEditingController? controller;
  final String title;
  final String? hintText;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title).bodyMedium.semiBold.charcoalGray,
        Gap(8),
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.primary, width: 0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.lightGray, width: 0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: AppColor.offWhite,
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColor.paleSlate,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),

            prefixIcon: Icon(prefixIcon, color: AppColor.paleSlate, fill: 0.4, size: 20),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
