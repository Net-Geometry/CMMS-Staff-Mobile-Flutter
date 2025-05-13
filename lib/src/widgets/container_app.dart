import 'package:flutter/material.dart';

extension ContainerExtension on Container {
  Container get border => Container(
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: child,
  );
}
