import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/base/base_repository.dart';
import 'package:test_project/features/catalog/data/catalog_local_data_source.dart';
import 'package:test_project/features/catalog/entities/product_detail.dart';

final productDetailRepositoryProvider =
    Provider.family<ProductDetailRepository, String>((ref, productId) {
  return ProductDetailRepositoryImpl(
    CatalogLocalDataSource(),
    productId,
  );
});

abstract class ProductDetailRepository extends BaseRepository<ProductDetail> {}

/// Реализация репозитория деталей продукта
class ProductDetailRepositoryImpl extends BaseRepositoryImpl<ProductDetail>
    implements ProductDetailRepository {
  final CatalogLocalDataSource local;
  final String productId;

  ProductDetailRepositoryImpl(
    this.local,
    this.productId,
  );

  @override
  Future<ProductDetail> getFromDataSource() async {
    return await local.getProductDetail(productId);
  }
}
