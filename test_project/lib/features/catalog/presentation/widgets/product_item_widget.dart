import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:test_project/core/base/widgets/card_widget.dart';
import 'package:test_project/core/base/widgets/safe_network_image.dart';
import 'package:test_project/core/theme/theme_builder.dart';
import 'package:test_project/core/utils/extensions/double_currency_formatter.dart';
import 'package:test_project/features/catalog/entities/product.dart';
import 'package:test_project/features/cart/presentation/controllers/cart_controller.dart';
import 'package:test_project/features/cart/data/data/db.dart';

class ProductItem extends ConsumerWidget {
  final Product product;
  final VoidCallback onTap;

  ProductItem({
    required this.product,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cartControllerProvider);
    final cartController = ref.read(cartControllerProvider.notifier);
    final CartItem? cartItem =
        cartController.getCartItemByProductId(product.id);

    return GestureDetector(
      onTap: onTap,
      child: CardWidget(
        child: Column(
          children: <Widget>[
            buildImage(),
            buildInfo(),
            const Gap(8),
            buildCartControls(context, cartItem, cartController),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SafeNetworkImage(imageUrl: product.image),
    );
  }

  Widget buildInfo() {
    return Column(
      children: <Widget>[
        Text(product.name, style: AppTextStyle.title),
        Text(product.price.toCurrencyString(), style: AppTextStyle.title),
      ],
    );
  }

  Widget buildCartControls(
    BuildContext context,
    CartItem? cartItem,
    CartController cartController,
  ) {
    if (cartItem == null) {
      return ElevatedButton(
        onPressed: () {
          cartController.add(
            CartItem(
              quantity: 1,
              id: product.id,
              name: product.name,
              image: product.image,
              price: product.price,
            ),
          );
        },
        child: Text('Добавить в корзину', style: AppTextStyle.body),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            if (cartItem.quantity == 1) {
              cartController.remove(cartItem.id);
            } else {
              cartController.updateQuantity(cartItem.id, cartItem.quantity - 1);
            }
          },
          child: const Icon(Icons.remove),
        ),
        Text('${cartItem.quantity}', style: AppTextStyle.title),
        ElevatedButton(
          onPressed: () {
            cartController.updateQuantity(cartItem.id, cartItem.quantity + 1);
          },
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
