import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/base/base_repository.dart';
import 'package:test_project/features/profile/data/profile_local_datasource.dart';
import 'package:test_project/features/profile/entities/user_profile.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepositoryImpl(ProfileLocalDataSource());
});

/// Абстрактный интерфейс для репозитория профиля
abstract class ProfileRepository extends BaseRepository<UserProfile> {}

/// Реализация репозитория профиля
class ProfileRepositoryImpl extends BaseRepositoryImpl<UserProfile>
    implements ProfileRepository {
  final ProfileLocalDataSource local;

  ProfileRepositoryImpl(this.local);

  @override
  Future<UserProfile> getFromDataSource() async {
    return await local.loadProfile();
  }
}
