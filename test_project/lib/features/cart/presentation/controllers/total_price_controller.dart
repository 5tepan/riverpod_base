import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_project/features/cart/data/data/db.dart';
import 'package:test_project/features/cart/presentation/controllers/cart_controller.dart';

part 'total_price_controller.g.dart';

@riverpod
double totalPrice(ref) {
  final cartState = ref.watch(cartControllerProvider);

  if (cartState is AsyncData<List<CartItem>>) {
    return cartState.value.fold(
      0.0,
      (sum, item) => sum + item.price * item.quantity,
    );
  }
  return 0.0;
}
