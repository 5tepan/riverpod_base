import 'package:flutter/material.dart';
import 'package:test_project/core/theme/theme_builder.dart';

class CardWidget extends StatelessWidget {
  final EdgeInsets? padding;
  final Color backgroundColor;
  final Widget child;
  final BorderRadiusGeometry? borderRadius;
  final double? width;

  const CardWidget({
    super.key,
    this.padding,
    this.backgroundColor = AppColors.white,
    required this.child,
    this.borderRadius,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding ?? const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
