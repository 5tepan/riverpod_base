import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/base/base_controllers/base_async_controller.dart';
import 'package:test_project/core/utils/error.dart';
import 'package:test_project/core/utils/string_validator.dart';
import 'package:test_project/features/profile/entities/user_profile.dart';
import 'package:test_project/features/profile/data/profile_repository.dart';

final profileControllerProvider =
    AsyncNotifierProvider<ProfileController, UserProfile>(
  ProfileController.new,
);

class ProfileController extends BaseAsyncNotifier<UserProfile> {
  // Даты для выбора
  DateTime maxDate = DateTime.now();
  DateTime minDate = DateTime(1900);

  // Контроллеры для полей формы
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Дополнительное поле для даты рождения
  DateTime? _dateOfBirth;

  DateTime get dateOfBirth => _dateOfBirth ?? DateTime.now();
  final isChanged = ValueNotifier<bool>(false);

  @override
  Future<Result<UserProfile>> fetchResult() async {
    final repo = ref.read(profileRepositoryProvider);
    final result = await repo.fetch();

    // При успешной загрузке — заполняем контроллеры
    result.when(
      success: (user) {
        _prepareData(user);
        _addListeners(user);
      },
      failure: (error, stackTrace) => null,
    );

    return result;
  }

  void _prepareData(UserProfile user) {
    _dateOfBirth = user.dateOfBirth;
    nameController.text = user.name;
    emailController.text = user.email;
    phoneController.text = user.phone;
  }

  void _addListeners(UserProfile user) {
    nameController.addListener(() => _checkChanges(user));
    emailController.addListener(() => _checkChanges(user));
    phoneController.addListener(() => _checkChanges(user));
  }

  void _checkChanges(UserProfile user) {
    final hasChanges = nameController.text != user.name ||
        emailController.text != user.email ||
        phoneController.text != user.phone ||
        _dateOfBirth != user.dateOfBirth;

    isChanged.value = hasChanges;
  }

  void setDateOfBirth(DateTime? date) {
    _dateOfBirth = date;
    if (state.value != null) _checkChanges(state.value!);
  }

  void updateField({
    String? name,
    String? email,
    String? phone,
    DateTime? dateOfBirth,
    List<String>? avatars,
  }) {
    final current = state.value!;
    final updated = UserProfile(
      name: name ?? nameController.text,
      email: email ?? emailController.text,
      phone: phone ?? phoneController.text,
      dateOfBirth: dateOfBirth ?? _dateOfBirth ?? current.dateOfBirth,
      avatars: avatars ?? current.avatars,
    );

    _dateOfBirth = updated.dateOfBirth;

    if (updated != current) {
      state = AsyncData(updated);
    }
  }

  // Валидаторы

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Имя не может быть пустым';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email обязателен';
    }
    return StringValidator.validateEmail(email: value)
        ? null
        : "Введите корректный e-mail";
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Телефон обязателен';
    }
    return StringValidator.validatePhone(phone: value)
        ? null
        : "Введите корректный номер телефона";
  }

  String? validateDate(DateTime? value) {
    if (value == null) {
      return 'Дата рождения обязательна';
    }
    return null;
  }
}
