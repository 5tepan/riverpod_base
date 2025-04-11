import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/base/base_controllers/base_async_family_controller.dart';
import 'package:test_project/core/utils/error.dart';
import 'package:test_project/features/catalog/data/product_detail_repository.dart';
import 'package:test_project/features/catalog/entities/product_detail.dart';

final productsDetailControllerProvider = AsyncNotifierProvider.autoDispose
    .family<ProductsDetailController, ProductDetail, String>(
        ProductsDetailController.new);

class ProductsDetailController
    extends BaseFamilyAsyncNotifier<ProductDetail, String> {
  @override
  Future<Result<ProductDetail>> fetchResult(String productId) {
    final repo = ref.read(productDetailRepositoryProvider(productId));
    return repo.fetch();
  }
}
