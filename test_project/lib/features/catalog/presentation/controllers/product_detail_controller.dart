import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_project/features/catalog/data/product_detail_repository.dart';
import 'package:test_project/features/catalog/entities/product_detail.dart';
import 'package:test_project/core/utils/helpers/result_helper.dart';

part 'product_detail_controller.g.dart';

@riverpod
class ProductsDetailController extends _$ProductsDetailController {
  @override
  Future<ProductDetail> build(String productId) async {
    final _repository = ref.read(productDetailRepositoryProvider(productId));
    final result = await _repository.fetch();
    return unwrapResult(result);
  }
}
