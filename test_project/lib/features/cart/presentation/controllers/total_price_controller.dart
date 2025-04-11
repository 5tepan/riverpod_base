import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/features/cart/presentation/controllers/cart_controller.dart';

final totalPriceProvider = Provider<double>(
  (ref) {
    final cartState = ref.watch(cartControllerProvider);

    return cartState.maybeWhen(
      data: (items) => items.fold(
        0,
        (sum, item) => sum + item.price * item.quantity,
      ),
      orElse: () => 0,
    );
  },
);
