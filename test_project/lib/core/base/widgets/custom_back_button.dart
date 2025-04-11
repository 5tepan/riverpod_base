import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project/core/utils/assets_catalog.dart';

class CustomBackButton extends StatelessWidget {
  final EdgeInsets padding;
  final VoidCallback? onPressed;

  const CustomBackButton({
    super.key,
    this.onPressed,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          context.pop();
        }
      },
      child: Padding(
        padding: padding,
        child: Image.asset(
          AssetsCatalog.appBarLeading,
          height: 24,
          width: 24,
        ),
      ),
    );
  }
}
