import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project/core/base/base_list_view_page.dart';
import 'package:test_project/core/router/app_router.dart';
import 'package:test_project/core/theme/theme_builder.dart';
import 'package:test_project/features/catalog/entities/category.dart';
import 'package:test_project/features/catalog/presentation/controllers/category_controller.dart';
import 'package:test_project/features/catalog/presentation/widgets/category_item_widget.dart';
import 'package:test_project/features/catalog/router/catalog_route.dart';

class CatalogPage extends BaseListPage<Category> {
  const CatalogPage({
    super.key,
    super.title = 'Каталог',
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CatalogPageState();
}

class _CatalogPageState extends BaseListPageState<CatalogPage, Category> {
  @override
  bool canPop = false;

  @override
  Color backgroundColor() => AppColors.lightPlatinum;

  @override
  ProviderBase<AsyncValue<List<Category>>> get provider =>
      categoryControllerProvider;

  @override
  Widget buildListItem(BuildContext context, Category item, int index) {
    return CategoryItemWidget(
      category: item,
      onTap: () => context.push(
        CategoryRoute(categoryId: item.id).location,
        extra: item.name,
      ),
    );
  }

  @override
  Widget buildSeparator(BuildContext context, int index) => const Gap(12);

  @override
  EdgeInsets listPadding() => const EdgeInsets.all(12);
}
