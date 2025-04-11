// Общий интерфейс для репозитория
import 'package:test_project/core/utils/error.dart';

abstract class BaseRepository<T> {
  Future<Result<T>> fetch();
}

// Базовая реализация репозитория для работы с данными (локальные данные или другие источники)
abstract class BaseRepositoryImpl<T> implements BaseRepository<T> {
  // Этот метод будет реализовываться в каждом репозитории
  Future<T> getFromDataSource();

  Future<Result<T>> fetch() async {
    try {
      final data = await getFromDataSource();
      return Success(data);
    } catch (e, st) {
      return Failure(e, st);
    }
  }
}
