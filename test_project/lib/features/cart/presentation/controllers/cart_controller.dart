import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/base/base_controllers/base_async_controller.dart';
import 'package:test_project/core/utils/error.dart';
import 'package:test_project/core/utils/helpers/result_helper.dart';
import 'package:test_project/features/cart/data/cart_repository.dart';
import 'package:test_project/features/cart/data/data/db.dart';

final cartControllerProvider =
    AsyncNotifierProvider<CartController, List<CartItem>>(CartController.new);

class CartController extends BaseAsyncNotifier<List<CartItem>> {
  CartRepository get _repository => ref.read(cartRepositoryProvider);

  @override
  Future<Result<List<CartItem>>> fetchResult() async {
    return _repository.fetch();
  }

  /// Получить CartItem по productId
  CartItem? getCartItemByProductId(String productId) {
    final items = state.valueOrNull;
    if (items == null) return null;

    return items.where((item) => item.id == productId).firstOrNull;
  }

  /// Добавить товар
  Future<void> add(CartItem item) async {
    await _safePerform(() => _repository.addToCart(item));
  }

  /// Удалить товар
  Future<void> remove(String id) async {
    await _safePerform(() => _repository.removeFromCart(id));
  }

  /// Очистить корзину
  Future<void> clear() async {
    await _safePerform(() => _repository.clearCart());
  }

  /// Обновить количество
  Future<void> updateQuantity(String id, int quantity) async {
    await _safePerform(() => _repository.updateQuantity(id, quantity));
  }

  /// Безопасное выполнение действия с обновлением состояния
  Future<void> _safePerform(Future<void> Function() operation) async {
    if (!state.hasValue) return;

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await operation();
      final result = await fetchResult();
      return unwrapResult(result);
    });
  }
}
