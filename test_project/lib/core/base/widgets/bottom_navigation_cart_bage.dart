import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/theme/theme_builder.dart';
import 'package:test_project/features/cart/presentation/controllers/cart_items_count_controller.dart';

class BottomNavigationCartBage extends ConsumerWidget {
  const BottomNavigationCartBage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(cartItemsCountProvider);
    if (count == 0) return const SizedBox.shrink();
    return Container(
      width: 14,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
      child: Text(
        '$count',
        style: AppTextStyle.body.copyWith(
          color: AppColors.white,
          fontSize: 9,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
