import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/base/base_page.dart';
import 'package:test_project/core/utils/mixins/calculate_grid_mixin.dart';

/// Базовое состояние для страницы с GridView
abstract class BaseGridPageState<W extends BaseAsyncPage, T>
    extends BaseAsyncPageState<W, List<T>> with CalculateGridMixin {
  double screenWidth = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery.sizeOf(context).width;
  }

  /// Провайдер для получения данных грида
  ProviderBase<AsyncValue<List<T>>> get provider;

  @override
  AsyncValue<List<T>> buildProvider(WidgetRef ref) => ref.watch(provider);

  /// Построение отдельного элемента грида
  Widget buildGridItem(BuildContext context, T item, int index);

  /// Шапка списка (опционально)
  Widget? buildHeader(BuildContext context) => null;

  /// Колонтитул (опционально)
  Widget? buildFooter(BuildContext context) => null;

  /// Отображение пустого состояния
  Widget buildEmptyPlaceholder(BuildContext context) =>
      const Center(child: Text('Данные отсутствуют'));

  @override
  double get gridWidth => screenWidth;

  @override
  double get gridItemHeight => 300.0;

  /// Отступ между элементами по горизонтали
  @override
  double get crossAxisSpacing => 10.0;

  /// Отступ между элементами по вертикали
  @override
  double get mainAxisSpacing => 10.0;

  /// Количество колонок в гриде
  @override
  int get axisCount => 2;

  /// Паддинги вокруг грида
  EdgeInsets gridPadding() => EdgeInsets.zero;

  /// Создает делегат для GridView
  SliverGridDelegate get gridDelegate =>
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: axisCount,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        childAspectRatio: getChildAspectRatio(),
      );

  @override
  Widget buildContent(BuildContext context, List<T> items) {
    if (items.isEmpty) {
      return buildEmptyPlaceholder(context);
    }

    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(provider),
      child: CustomScrollView(
        slivers: [
          if (buildHeader(context) != null)
            SliverToBoxAdapter(child: buildHeader(context)!),
          SliverPadding(
            padding: gridPadding(),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => buildGridItem(context, items[index], index),
                childCount: items.length,
              ),
              gridDelegate: gridDelegate,
            ),
          ),
          if (buildFooter(context) != null)
            SliverToBoxAdapter(child: buildFooter(context)!),
        ],
      ),
    );
  }
}
