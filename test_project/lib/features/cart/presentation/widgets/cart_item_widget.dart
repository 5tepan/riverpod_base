import 'package:flutter/material.dart';
import 'package:test_project/core/base/widgets/card_widget.dart';
import 'package:test_project/core/base/widgets/safe_network_image.dart';
import 'package:test_project/core/theme/theme_builder.dart';
import 'package:test_project/core/utils/assets_catalog.dart';
import 'package:test_project/core/utils/extensions/double_currency_formatter.dart';
import 'package:test_project/features/cart/data/data/db.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final VoidCallback onTap;
  final VoidCallback onRemove;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onTap,
    required this.onRemove,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CardWidget(
        child: Row(
          spacing: 12,
          children: <Widget>[
            buildImage(context),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: <Widget>[
                  buildInfo(context),
                  buildCartControls(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SafeNetworkImage(imageUrl: item.image),
      ),
    );
  }

  Widget buildInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Text(
                item.name,
                style: AppTextStyle.title,
              ),
            ),
            GestureDetector(
              onTap: onRemove,
              child: Image.asset(
                AssetsCatalog.icClose,
                width: 24,
                height: 24,
              ),
            )
          ],
        ),
        Text(
          item.price.toCurrencyString(),
          style: AppTextStyle.title,
        ),
      ],
    );
  }

  Widget buildCartControls(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        ElevatedButton(
          child: const Icon(Icons.remove),
          onPressed: item.quantity > 1 ? onDecrement : onRemove,
        ),
        Text(
          '${item.quantity}',
          style: AppTextStyle.title,
        ),
        ElevatedButton(
          child: const Icon(Icons.add),
          onPressed: onIncrement,
        ),
      ],
    );
  }
}
