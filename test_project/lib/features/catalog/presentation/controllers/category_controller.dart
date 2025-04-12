import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_project/features/catalog/data/category_repository.dart';
import 'package:test_project/features/catalog/entities/category.dart';
import 'package:test_project/core/utils/helpers/result_helper.dart';

part 'category_controller.g.dart';

@riverpod
class CategoryController extends _$CategoryController {
  CategoryRepository get _repository => ref.read(categoryRepositoryProvider);

  @override
  Future<List<Category>> build() async {
    final result = await _repository.fetch();
    return unwrapResult(result);
  }
}
