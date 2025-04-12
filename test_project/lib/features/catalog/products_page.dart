import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project/core/base/base_grid_view_page.dart';
import 'package:test_project/core/base/base_page.dart';
import 'package:test_project/core/router/app_router.dart';
import 'package:test_project/core/theme/theme_builder.dart';
import 'package:test_project/features/catalog/entities/product.dart';
import 'package:test_project/features/catalog/presentation/controllers/products_controller.dart';
import 'package:test_project/features/catalog/presentation/widgets/product_item_widget.dart';
import 'package:test_project/features/catalog/router/catalog_route.dart';

class ProductsPage extends BaseAsyncPage {
  final String categoryId;
  final String categoryName;

  const ProductsPage({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends BaseGridPageState<ProductsPage, Product> {
  @override
  Color backgroundColor() => AppColors.lightPlatinum;

  @override
  double get gridWidth => screenWidth - gridPadding().horizontal;

  @override
  double get mainAxisSpacing => 16;

  @override
  double get crossAxisSpacing => 11;

  @override
  double get fixedTopHeightItemRatio => 1.125;

  @override
  double get fixedBottomItemHeight => 87;

  @override
  ProviderBase<AsyncValue<List<Product>>> get provider =>
      productsControllerProvider(widget.categoryId);

  @override
  Widget buildGridItem(BuildContext context, Product product, int index) {
    return ProductItem(
      product: product,
      onTap: () => context.push(
        ProductRoute(
          categoryId: widget.categoryId,
          productId: product.id,
        ).location,
        extra: product.name,
      ),
    );
  }

  @override
  EdgeInsets gridPadding() => const EdgeInsets.all(12);

  @override
  Widget buildEmptyPlaceholder(BuildContext context) {
    return const Center(child: Text('Товары в этой категории отсутствуют'));
  }

  @override
  Widget? buildAppBarTitle(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: AutoSizeText(
        widget.categoryName,
        maxLines: 2,
        minFontSize: 16,
        style: AppTextStyle.extraTitle,
      ),
    );
  }
}
