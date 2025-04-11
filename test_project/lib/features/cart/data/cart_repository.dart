import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/base/base_repository.dart';
import 'package:test_project/di/db_provider.dart';
import 'package:test_project/features/cart/data/data/cart_dao.dart';
import 'package:test_project/features/cart/data/data/db.dart';

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  final db = ref.read(dbProvider);
  return CartRepositoryImpl(CartDao(db));
});

/// Абстрактный интерфейс для репозитория корзины
abstract class CartRepository extends BaseRepository<List<CartItem>> {
  Future<void> addToCart(CartItem item);
  Future<void> removeFromCart(String id);
  Future<void> clearCart();
  Future<void> updateQuantity(String id, int quantity);
}

/// Реализация репозитория корзины через Drift DAO
class CartRepositoryImpl extends BaseRepositoryImpl<List<CartItem>>
    implements CartRepository {
  final CartDao dao;

  CartRepositoryImpl(this.dao);

  @override
  Future<List<CartItem>> getFromDataSource() async {
    return await dao.getAllItems();
  }

  @override
  Future<void> addToCart(CartItem item) {
    return dao.insertItem(CartItemsCompanion(
      id: Value(item.id),
      name: Value(item.name),
      image: Value(item.image),
      price: Value(item.price),
      quantity: Value(item.quantity),
    ));
  }

  @override
  Future<void> removeFromCart(String id) => dao.deleteItem(id);

  @override
  Future<void> clearCart() => dao.clearCart();

  @override
  Future<void> updateQuantity(String id, int quantity) =>
      dao.updateQuantity(id, quantity);
}
