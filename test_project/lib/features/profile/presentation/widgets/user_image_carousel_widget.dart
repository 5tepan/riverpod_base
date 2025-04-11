import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_project/core/base/widgets/safe_network_image.dart';

class UserImageCarouselWidget extends StatefulWidget {
  final List<String> avatars;

  const UserImageCarouselWidget({
    super.key,
    this.avatars = const [],
  });

  @override
  State<UserImageCarouselWidget> createState() =>
      _UserImageCarouselWidgetState();
}

class _UserImageCarouselWidgetState extends State<UserImageCarouselWidget> {
  final ValueNotifier<int> currentPageNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1,
            viewportFraction: 1,
            onPageChanged: (index, reason) => currentPageNotifier.value = index,
          ),
          items: widget.avatars
              .map((avatar) => _buildItem(context, avatar))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildItem(BuildContext context, String avatar) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SafeNetworkImage(
          imageUrl: avatar,
        ),
      ),
    );
  }
}
