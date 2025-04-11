import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project/features/cart/cart_page.dart';

class CartRoute extends GoRouteData {
  const CartRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const CartPage();
}
