import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_project/features/catalog/data/product_repository.dart';
import 'package:test_project/features/catalog/entities/product.dart';
import 'package:test_project/core/utils/helpers/result_helper.dart';

part 'products_controller.g.dart';

@riverpod
class ProductsController extends _$ProductsController {
  @override
  Future<List<Product>> build(String categoryId) async {
    final _repository = ref.read(productRepositoryProvider(categoryId));
    final result = await _repository.fetch();
    return unwrapResult(result);
  }
}
