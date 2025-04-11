import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/utils/error.dart';
import 'package:test_project/core/utils/helpers/result_helper.dart';

abstract class BaseAsyncNotifier<T> extends AsyncNotifier<T> {
  Future<Result<T>> fetchResult();

  @override
  Future<T> build() async {
    final result = await fetchResult();
    return unwrapResult(result);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await fetchResult();
      return unwrapResult(result);
    });
  }
}
