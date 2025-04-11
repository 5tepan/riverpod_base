import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/base/base_controllers/base_async_family_controller.dart';
import 'package:test_project/core/utils/error.dart';
import 'package:test_project/features/catalog/data/product_repository.dart';
import 'package:test_project/features/catalog/entities/product.dart';

final productsControllerProvider = AsyncNotifierProvider.autoDispose
    .family<ProductsController, List<Product>, String>(ProductsController.new);

class ProductsController
    extends BaseFamilyAsyncNotifier<List<Product>, String> {
  @override
  Future<Result<List<Product>>> fetchResult(String categoryId) {
    final repo = ref.read(productRepositoryProvider(categoryId));
    return repo.fetch();
  }
}
