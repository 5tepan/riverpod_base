import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project/core/base/bottom_navigation/bottom_navigation_page.dart';
import 'package:test_project/features/cart/router/cart_route.dart';
import 'package:test_project/features/catalog/router/catalog_route.dart';
import 'package:test_project/features/profile/router/profile_route.dart';

part 'app_router.g.dart';

class AppRouter {
  static const String catalog = '/catalog';
  static const String cart = '/cart';
  static const String profile = '/profile';
  static const String productDetail = 'product/:productId';
  static const String category = 'category/:categoryId';
}

@TypedShellRoute<RootShellRoute>(
  routes: [
    TypedGoRoute<CatalogRoute>(
      path: AppRouter.catalog,
      routes: [
        TypedGoRoute<CategoryRoute>(
          path: AppRouter.category,
          routes: [
            TypedGoRoute<ProductRoute>(
              path: AppRouter.productDetail,
            ),
          ],
        ),
      ],
    ),
    TypedGoRoute<CartRoute>(path: AppRouter.cart),
    TypedGoRoute<ProfileRoute>(path: AppRouter.profile),
  ],
)
class RootShellRoute extends ShellRouteData {
  const RootShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget child) {
    return BottomNavigationPage(child: child);
  }
}

final router = GoRouter(
  initialLocation: const CatalogRoute().location,
  routes: $appRoutes,
);
