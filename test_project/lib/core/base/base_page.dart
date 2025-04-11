import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project/core/base/widgets/custom_back_button.dart';
import 'package:test_project/core/theme/theme_builder.dart';

abstract class BaseAsyncPage<T> extends ConsumerStatefulWidget {
  final String? title;

  const BaseAsyncPage({
    super.key,
    this.title,
  });
}

abstract class BaseAsyncPageState<W extends BaseAsyncPage<T>, T>
    extends ConsumerState<W> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool canPop = false;

  @override
  void initState() {
    super.initState();
    canPop = GoRouter.of(context).canPop();
  }

  Color? backgroundColor() => AppColors.backgroundColor;

  /// Провайдер, который возвращает AsyncValue<T>
  AsyncValue<T> buildProvider(WidgetRef ref);

  /// Виджет при загрузке
  Widget buildLoading(BuildContext context) =>
      const Center(child: CircularProgressIndicator());

  /// Виджет при ошибке
  Widget buildError(BuildContext context, Object error, StackTrace stack) =>
      Center(child: Text('Ошибка: $error'));

  /// Основной контент, когда данные загружены
  Widget buildContent(BuildContext context, T data);

  /// AppBar
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: buildAppBarTitle(context),
      leading: buildAppBarLeading(context),
      actions: buildAppBarActions(context),
      titleSpacing: canPop ? 0 : 16,
    );
  }

  Widget? buildAppBarTitle(BuildContext context) {
    if (widget.title == null) {
      return null;
    }
    return Align(
      alignment: Alignment.centerLeft,
      child: AutoSizeText(
        widget.title ?? '',
        maxLines: 2,
        minFontSize: 16,
        style: AppTextStyle.extraTitle,
      ),
    );
  }

  Widget? buildAppBarLeading(BuildContext context) {
    if (canPop && !(scaffoldKey.currentState?.isDrawerOpen ?? false)) {
      return const CustomBackButton();
    }
    return null;
  }

  List<Widget>? buildAppBarActions(BuildContext context) => null;

  Widget? buildFloatingActionButton(BuildContext context) => null;

  @override
  Widget build(BuildContext context) {
    final asyncValue = buildProvider(ref);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: ThemeBuilder.systemUiOverlayStyle,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: backgroundColor(),
        appBar: buildAppBar(context),
        floatingActionButton: buildFloatingActionButton(context),
        body: asyncValue.when(
          data: (data) => buildContent(context, data),
          loading: () => buildLoading(context),
          error: (e, s) => buildError(context, e, s),
        ),
      ),
    );
  }
}
