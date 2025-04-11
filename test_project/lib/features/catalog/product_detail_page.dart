import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/base/base_page.dart';
import 'package:test_project/core/base/widgets/safe_network_image.dart';
import 'package:test_project/core/theme/theme_builder.dart';
import 'package:test_project/core/utils/extensions/double_currency_formatter.dart';
import 'package:test_project/features/cart/data/data/db.dart';
import 'package:test_project/features/cart/presentation/controllers/cart_controller.dart';
import 'package:test_project/features/catalog/entities/product_detail.dart';
import 'package:test_project/features/catalog/presentation/controllers/product_detail_controller.dart';

class ProductDetailPage extends BaseAsyncPage<ProductDetail> {
  final String productId;

  const ProductDetailPage({
    required this.productId,
    super.key,
  });

  @override
  ConsumerState<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState
    extends BaseAsyncPageState<ProductDetailPage, ProductDetail> {
  @override
  AsyncValue<ProductDetail> buildProvider(WidgetRef ref) {
    return ref.watch(productsDetailControllerProvider(widget.productId));
  }

  @override
  Widget buildContent(BuildContext context, ProductDetail product) {
    ref.watch(cartControllerProvider);
    final cartController = ref.read(cartControllerProvider.notifier);
    final CartItem? cartItem =
        cartController.getCartItemByProductId(product.id);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildImage(context, product),
          Text(
            product.name,
            style: AppTextStyle.extraTitle,
          ),
          Text(
            product.price.toCurrencyString(),
            style: AppTextStyle.title,
          ),
          if (product.description.isNotEmpty)
            Text(
              product.description,
              style: AppTextStyle.body,
            ),
          buildCartControls(
            context,
            cartItem,
            cartController,
            product,
          ),
        ],
      ),
    );
  }

  Widget buildImage(BuildContext context, ProductDetail product) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SafeNetworkImage(
          imageUrl: product.image,
        ),
      ),
    );
  }

  Widget buildCartControls(
    BuildContext context,
    CartItem? cartItem,
    CartController cartController,
    ProductDetail product,
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
