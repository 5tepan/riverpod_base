import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_project/features/cart/data/data/db.dart';
import 'package:test_project/features/cart/presentation/controllers/cart_controller.dart';

part 'cart_items_count_controller.g.dart';

@riverpod
int cartItemsCount(ref) {
  final cart = ref.watch(cartControllerProvider);
  if (cart is AsyncData<List<CartItem>>) {
    return cart.value.fold<int>(0, (sum, item) => sum + item.quantity);
  }
  return 0;
}
