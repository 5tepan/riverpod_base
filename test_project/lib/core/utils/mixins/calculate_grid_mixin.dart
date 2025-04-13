/// Калькулятор размеров для GridView
mixin CalculateGridMixin {
  double get gridWidth => 200.0;

  double get gridItemHeight => 300.0;

  double? get gridItemRatio => null;

  double get crossAxisSpacing => 10.0;

  double get mainAxisSpacing => 10.0;

  int get axisCount => 2;

  double? get fixedTopHeightItemRatio => null;

  double? get fixedBottomItemHeight => null;

  double getChildAspectRatio() {
    if (gridItemRatio != null) {
      return gridItemRatio!;
    }
    final gridItemWidth =
        (gridWidth - (axisCount - 1) * crossAxisSpacing) / axisCount;
    if (fixedBottomItemHeight != null && fixedTopHeightItemRatio != null) {
      return gridItemWidth /
          ((gridItemWidth * fixedTopHeightItemRatio!) + fixedBottomItemHeight!);
    }
    return gridItemWidth / gridItemHeight;
  }
}
