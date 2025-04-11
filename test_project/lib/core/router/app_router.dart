import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project/core/base/bottom_navigation/bottom_navigation_page.dart';
import 'package:test_project/features/cart/router/cart_route.dart';
import 'package:test_project/features/catalog/router/catalog_route.dart';
import 'package:test_project/features/profile/router/profile_route.dart';

part 'app_router.g.dart';

@TypedShellRoute<RootShellRoute>(
  routes: [
    TypedGoRoute<CatalogRoute>(
      path: '/catalog',
      routes: [
        TypedGoRoute<CategoryRoute>(
          path: 'category/:categoryId',
          routes: [
            TypedGoRoute<ProductRoute>(
              path: 'product/:productId',
            ),
          ],
        ),
      ],
    ),
    TypedGoRoute<CartRoute>(path: '/cart'),
    TypedGoRoute<ProfileRoute>(path: '/profile'),
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
