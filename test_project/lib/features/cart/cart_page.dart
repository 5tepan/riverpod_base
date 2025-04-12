import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project/core/base/base_list_view_page.dart';
import 'package:test_project/core/base/widgets/base_alert_dialog.dart';
import 'package:test_project/core/base/widgets/card_widget.dart';
import 'package:test_project/core/router/app_router.dart';
import 'package:test_project/core/theme/theme_builder.dart';
import 'package:test_project/core/utils/extensions/double_currency_formatter.dart';
import 'package:test_project/features/cart/data/data/db.dart';
import 'package:test_project/features/cart/presentation/controllers/cart_controller.dart';
import 'package:test_project/features/cart/presentation/controllers/total_price_controller.dart';
import 'package:test_project/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:test_project/features/catalog/router/catalog_route.dart';

class CartPage extends BaseListPage<CartItem> {
  const CartPage({
    super.key,
    super.title = 'Корзина',
  });

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends BaseListPageState<CartPage, CartItem> {
  @override
  bool isFooterFixed = true;

  @override
  Color backgroundColor() => AppColors.lightPlatinum;

  @override
  ProviderBase<AsyncValue<List<CartItem>>> get provider =>
      cartControllerProvider;

  @override
  Widget buildListItem(BuildContext context, CartItem item, int index) {
    final cartController = ref.read(cartControllerProvider.notifier);
    return CartItemWidget(
      item: item,
      onTap: () => context
          .push(ProductRoute(categoryId: '-1', productId: item.id).location),
      onRemove: () => cartController.remove(item.id),
      onIncrement: () => cartController.updateQuantity(
        item.id,
        item.quantity + 1,
      ),
      onDecrement: () => cartController.updateQuantity(
        item.id,
        item.quantity - 1,
      ),
    );
  }

  @override
  Widget? buildFooter(BuildContext context) {
    final total = ref.watch(totalPriceProvider);
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12,
        left: 12,
        right: 12,
      ),
      child: CardWidget(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Итого:',
              style: AppTextStyle.title,
            ),
            Text(
              total.toCurrencyString(),
              style: AppTextStyle.title,
            ),
          ],
        ),
      ),
    );
  }

  @override
  List<Widget>? buildAppBarActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 16),
        child: GestureDetector(
          onTap: () => clearCart(),
          child: Text(
            'Очистить',
            style: AppTextStyle.title.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
      ),
    ];
  }

  void clearCart() {
    final cartController = ref.read(cartControllerProvider.notifier);
    showDialog(
      context: context,
      builder: (context) {
        return BaseAlertDialog(
          title: 'Очистить корзину?',
          positiveButtonTitle: 'Да',
          negativeButtonTitle: 'Нет',
          onPositiveButtonPressed: () {
            cartController.clear();
            context.pop();
          },
          onNegativeButtonPressed: () => context.pop(),
        );
      },
    );
  }

  @override
  EdgeInsets listPadding() => const EdgeInsets.only(
        bottom: kBottomNavigationBarHeight,
        left: 12,
        right: 12,
        top: 12,
      );

  @override
  Widget? buildSeparator(BuildContext context, int index) => const Gap(12);

  @override
  Widget buildEmptyPlaceholder(BuildContext context) {
    return const Center(child: Text('Корзина пуста'));
  }
}
