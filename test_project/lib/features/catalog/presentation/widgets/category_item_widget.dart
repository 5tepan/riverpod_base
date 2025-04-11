import 'package:flutter/material.dart';
import 'package:test_project/core/base/widgets/card_widget.dart';
import 'package:test_project/core/base/widgets/safe_network_image.dart';
import 'package:test_project/core/theme/theme_builder.dart';
import 'package:test_project/features/catalog/entities/category.dart';

class CategoryItemWidget extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const CategoryItemWidget({
    super.key,
    required this.category,
    required this.onTap,
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
            buildBody(context),
          ],
        ),
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SafeNetworkImage(imageUrl: category.image),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          category.name,
          style: AppTextStyle.title,
        ),
        Text(
          '${category.productCount.toString()} шт',
          style: AppTextStyle.body,
        ),
      ],
    );
  }
}
