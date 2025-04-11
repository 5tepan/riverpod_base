import 'package:flutter/material.dart';
import 'package:test_project/core/theme/theme_builder.dart';

class BaseAlertDialog extends StatelessWidget {
  final String title;
  final String? message;
  final String positiveButtonTitle;
  final String negativeButtonTitle;
  final VoidCallback? onPositiveButtonPressed;
  final VoidCallback? onNegativeButtonPressed;

  const BaseAlertDialog({
    super.key,
    this.title = 'Заголовок',
    this.message,
    this.positiveButtonTitle = 'Да',
    this.negativeButtonTitle = 'Нет',
    this.onPositiveButtonPressed,
    this.onNegativeButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: AppTextStyle.title),
      content: Text(message ?? ''),
      actions: [
        TextButton(
          onPressed: onPositiveButtonPressed,
          child: Text(positiveButtonTitle, style: AppTextStyle.title),
        ),
        TextButton(
          onPressed: onNegativeButtonPressed,
          child: Text(negativeButtonTitle, style: AppTextStyle.title),
        ),
      ],
    );
  }
}
