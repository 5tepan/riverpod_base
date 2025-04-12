import 'package:test_project/features/cart/data/cart_repository.dart';
import 'package:test_project/features/cart/data/data/db.dart';
import 'package:test_project/core/utils/helpers/result_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_controller.g.dart';

@riverpod
class CartController extends _$CartController {
  CartRepository get _repository => ref.read(cartRepositoryProvider);

  @override
  Future<List<CartItem>> build() async {
    final result = await _repository.fetch();
    return unwrapResult(result);
  }

  CartItem? getCartItemByProductId(String productId) {
    final items = state.valueOrNull;
    if (items == null) return null;

    return items.where((item) => item.id == productId).firstOrNull;
  }

  Future<void> add(CartItem item) async {
    await _safePerform(() => _repository.addToCart(item));
  }

  Future<void> remove(String id) async {
    await _safePerform(() => _repository.removeFromCart(id));
  }

  Future<void> clear() async {
    await _safePerform(() => _repository.clearCart());
  }

  Future<void> updateQuantity(String id, int quantity) async {
    await _safePerform(() => _repository.updateQuantity(id, quantity));
  }

  Future<void> _safePerform(Future<void> Function() operation) async {
    if (!state.hasValue) return;

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await operation();
      final result = await _repository.fetch();
      return unwrapResult(result);
    });
  }
}
