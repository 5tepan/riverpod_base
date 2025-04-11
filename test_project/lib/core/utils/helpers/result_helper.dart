import 'package:test_project/core/utils/error.dart';

T unwrapResult<T>(Result<T> result) {
  return result.when(
    success: (data) => data,
    failure: (error, _) => throw error,
  );
}
