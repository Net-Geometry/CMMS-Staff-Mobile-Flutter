import 'package:cmms_staff_mobile_flutter/src/utils/utils.dart';
import 'package:flutter/material.dart';

class ContainerElevation extends StatelessWidget {
  const ContainerElevation({super.key, required this.child, this.padding, this.width});
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.fromLTRB(20, 30, 20, 40),
      width: width ?? context.sizeWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, 4))],
      ),
      child: child,
    );
  }
}
