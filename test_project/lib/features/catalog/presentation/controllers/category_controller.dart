import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/base/base_controllers/base_async_controller.dart';
import 'package:test_project/core/utils/error.dart';
import 'package:test_project/features/catalog/data/category_repository.dart';
import 'package:test_project/features/catalog/entities/category.dart';

final categoryControllerProvider =
    AsyncNotifierProvider<CategoryController, List<Category>>(
  CategoryController.new,
);

class CategoryController extends BaseAsyncNotifier<List<Category>> {
  @override
  Future<Result<List<Category>>> fetchResult() {
    final repo = ref.read(categoryRepositoryProvider);
    return repo.fetch();
  }
}
