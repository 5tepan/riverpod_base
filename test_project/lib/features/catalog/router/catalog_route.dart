import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project/features/catalog/catalog_page.dart';
import 'package:test_project/features/catalog/product_detail_page.dart';
import 'package:test_project/features/catalog/products_page.dart';

class CatalogRoute extends GoRouteData {
  const CatalogRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => CatalogPage();
}

class CategoryRoute extends GoRouteData {
  final String categoryId;

  const CategoryRoute({
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) => ProductsPage(
        categoryId: categoryId,
      );
}

class ProductRoute extends GoRouteData {
  final String categoryId;
  final String productId;

  ProductRoute({
    required this.categoryId,
    required this.productId,
  });

  factory ProductRoute.fromState(GoRouterState state) {
    final categoryId = state.pathParameters['categoryId']!;
    final productId = state.pathParameters['productId']!;
    return ProductRoute(
      categoryId: categoryId,
      productId: productId,
    );
  }

  @override
  Widget build(BuildContext context, GoRouterState state) => ProductDetailPage(
        productId: productId,
      );
}
