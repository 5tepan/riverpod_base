import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_project/features/profile/entities/user_profile.dart';
import 'package:test_project/features/profile/data/profile_repository.dart';
import 'package:test_project/core/utils/string_validator.dart';
import 'package:test_project/core/utils/helpers/result_helper.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  DateTime maxDate = DateTime.now();
  DateTime minDate = DateTime(1900);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  DateTime? _dateOfBirth;
  DateTime get dateOfBirth => _dateOfBirth ?? DateTime.now();

  final isChanged = ValueNotifier<bool>(false);

  ProfileRepository get _repository => ref.read(profileRepositoryProvider);

  @override
  Future<UserProfile> build() async {
    final result = await _repository.fetch();

    result.when(
      success: (user) {
        _prepareData(user);
        _addListeners(user);
      },
      failure: (_, __) => null,
    );

    return unwrapResult(result);
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
