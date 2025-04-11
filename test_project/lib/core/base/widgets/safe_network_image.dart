import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:test_project/core/utils/assets_catalog.dart';

class SafeNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final String placeholder;
  final BoxFit fit;
  final BoxFit placeholderFit;

  const SafeNetworkImage({
    super.key,
    this.imageUrl,
    this.placeholder = AssetsCatalog.placeholder,
    this.fit = BoxFit.cover,
    this.placeholderFit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl?.isEmpty ?? true) {
      return Image.asset(
        placeholder,
        fit: placeholderFit,
        colorBlendMode: BlendMode.color,
      );
    }

    return ExtendedImage.network(
      imageUrl ?? '',
      fit: fit,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.width * 0.1,
                child: const CircularProgressIndicator(strokeWidth: 3),
              ),
            );
          case LoadState.completed:
            return state.completedWidget;
          case LoadState.failed:
            return Image.asset(
              placeholder,
              fit: placeholderFit,
              colorBlendMode: BlendMode.color,
            );
        }
      },
    );
  }
}
