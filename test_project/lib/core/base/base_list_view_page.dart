import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/base/base_page.dart';

/// Базовый виджет для страницы со списком
abstract class BaseListPage<T> extends BaseAsyncPage<List<T>> {
  const BaseListPage({
    super.key,
    super.title,
  });
}

/// Базовое состояние для страницы со списком
abstract class BaseListPageState<W extends BaseListPage<T>, T>
    extends BaseAsyncPageState<W, List<T>> {
  bool isFooterFixed = false;

  /// Провайдер для получения данных списка
  ProviderBase<AsyncValue<List<T>>> get provider;

  @override
  AsyncValue<List<T>> buildProvider(WidgetRef ref) => ref.watch(provider);

  /// Построение отдельного элемента списка
  Widget buildListItem(BuildContext context, T item, int index);

  /// Колонтитул (опционально)
  Widget? buildHeader(BuildContext context) => null;

  /// Шапка списка (опционально)
  Widget? buildFooter(BuildContext context) => null;

  /// Разделители между элементами
  Widget? buildSeparator(BuildContext context, int index) =>
      const Divider(height: 1);

  /// Паддинги вокруг списка
  EdgeInsetsGeometry listPadding() {
    return EdgeInsets.zero;
  }

  /// Отображение пустого состояния
  Widget buildEmptyPlaceholder(BuildContext context) =>
      const Center(child: Text('Список пуст'));

  @override
  Widget buildContent(BuildContext context, List<T> items) {
    if (items.isEmpty) {
      return buildEmptyPlaceholder(context);
    }

    final hasHeader = buildHeader(context) != null;
    final hasFooter = buildFooter(context) != null;

    final listView = RefreshIndicator(
      onRefresh: () async => ref.invalidate(provider),
      child: ListView.separated(
        padding: listPadding(),
        itemCount: items.length +
            (hasHeader ? 1 : 0) +
            (hasFooter && !isFooterFixed ? 1 : 0),
        separatorBuilder: (context, index) {
          if (hasHeader && index == 0) return const SizedBox.shrink();
          return buildSeparator(context, index) ?? const SizedBox.shrink();
        },
        itemBuilder: (context, index) {
          final headerOffset = hasHeader ? 1 : 0;
          // final footerOffset = (hasFooter && !isFooterFixed) ? 1 : 0;

          if (hasHeader && index == 0) return buildHeader(context)!;
          if (hasFooter &&
              !isFooterFixed &&
              index == (items.length + headerOffset)) {
            return buildFooter(context)!;
          }

          final itemIndex = index - headerOffset;
          final item = items[itemIndex];
          return buildListItem(context, item, itemIndex);
        },
      ),
    );

    if (hasFooter && isFooterFixed) {
      return Column(
        children: [
          Expanded(child: listView),
          buildFooter(context)!,
        ],
      );
    }

    return listView;
  }
}
