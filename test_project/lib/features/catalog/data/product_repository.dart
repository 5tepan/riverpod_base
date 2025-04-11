import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/base/base_repository.dart';
import 'package:test_project/features/catalog/data/catalog_local_data_source.dart';
import 'package:test_project/features/catalog/entities/product.dart';

final productRepositoryProvider =
    Provider.family<ProductRepository, String>((ref, categoryId) {
  return ProductRepositoryImpl(
    CatalogLocalDataSource(),
    categoryId,
  );
});

/// Абстрактный интерфейс для репозитория продуктов
abstract class ProductRepository extends BaseRepository<List<Product>> {}

/// Реализация репозитория продуктов
class ProductRepositoryImpl extends BaseRepositoryImpl<List<Product>>
    implements ProductRepository {
  final CatalogLocalDataSource local;
  final String categoryId;

  ProductRepositoryImpl(
    this.local,
    this.categoryId,
  );

  @override
  Future<List<Product>> getFromDataSource() async {
    return await local.getProductsByCategory(categoryId);
  }
}
