import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/utils/error.dart';
import 'package:test_project/core/utils/helpers/result_helper.dart';

abstract class BaseFamilyAsyncNotifier<T, A>
    extends AutoDisposeFamilyAsyncNotifier<T, A> {
  Future<Result<T>> fetchResult(A arg);

  @override
  Future<T> build(A arg) async {
    final result = await fetchResult(arg);
    return unwrapResult(result);
  }

  Future<void> refresh(A arg) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await fetchResult(arg);
      return unwrapResult(result);
    });
  }
}
