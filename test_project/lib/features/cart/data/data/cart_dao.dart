import 'package:drift/drift.dart';
import 'package:test_project/features/cart/data/data/db.dart';

class CartDao {
  final AppDatabase db;

  CartDao(this.db);

  Future<List<CartItem>> getAllItems() => db.select(db.cartItems).get();

  Stream<List<CartItem>> watchAllItems() => db.select(db.cartItems).watch();

  Future<void> insertItem(CartItemsCompanion item) =>
      db.into(db.cartItems).insertOnConflictUpdate(item);

  Future<void> deleteItem(String id) =>
      (db.delete(db.cartItems)..where((tbl) => tbl.id.equals(id))).go();

  Future<void> clearCart() => db.delete(db.cartItems).go();

  Future<void> updateQuantity(String id, int quantity) async {
    await (db.update(db.cartItems)..where((tbl) => tbl.id.equals(id))).write(
      CartItemsCompanion(quantity: Value(quantity)),
    );
  }
}
