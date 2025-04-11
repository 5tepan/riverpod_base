import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/base/base_repository.dart';
import 'package:test_project/features/catalog/data/catalog_local_data_source.dart';
import 'package:test_project/features/catalog/entities/category.dart';

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepositoryImpl(CatalogLocalDataSource());
});

/// Абстрактный интерфейс для репозитория категорий
abstract class CategoryRepository extends BaseRepository<List<Category>> {}

/// Реализация репозитория категорий
class CategoryRepositoryImpl extends BaseRepositoryImpl<List<Category>>
    implements CategoryRepository {
  final CatalogLocalDataSource local;

  CategoryRepositoryImpl(this.local);

  @override
  Future<List<Category>> getFromDataSource() async {
    return await local.getCategories();
  }
}
