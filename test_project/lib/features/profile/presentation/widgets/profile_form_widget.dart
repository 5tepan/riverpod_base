import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_project/core/base/widgets/card_widget.dart';
import 'package:test_project/features/profile/entities/user_profile.dart';
import 'package:test_project/features/profile/presentation/controllers/profile_controller.dart';
import 'package:test_project/features/profile/presentation/widgets/user_image_carousel_widget.dart';

class ProfileFormWidget extends StatelessWidget {
  final UserProfile user;
  final ProfileController controller;

  ProfileFormWidget({
    super.key,
    required this.user,
    required this.controller,
  });

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 12,
            children: [
              UserImageCarouselWidget(
                avatars: user.avatars,
              ),
              CardWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 12,
                  children: <Widget>[
                    _buildFullNameField(context),
                    _buildEmailField(context),
                    _buildPhoneField(context),
                    _buildDateField(context),
                    _buildSubmitButton(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFullNameField(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.name,
      controller: controller.nameController,
      decoration: const InputDecoration(
        isDense: true,
        hintText: 'ФИО',
      ),
      validator: controller.validateName,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return TextFormField(
      controller: controller.emailController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        isDense: true,
        hintText: 'Email',
      ),
      validator: controller.validateEmail,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _buildPhoneField(BuildContext context) {
    return TextFormField(
      controller: controller.phoneController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        isDense: true,
        hintText: 'Номер телефона',
      ),
      validator: controller.validatePhone,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _buildDateField(BuildContext context) {
    return DateTimeFormField(
      initialValue: user.dateOfBirth,
      firstDate: controller.minDate,
      lastDate: controller.maxDate,
      mode: DateTimeFieldPickerMode.date,
      dateFormat: DateFormat("dd.MM.yyyy"),
      decoration: const InputDecoration(
        hintText: 'Дата рождения',
        isDense: true,
      ),
      validator: controller.validateDate,
      onChanged: controller.setDateOfBirth,
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: controller.isChanged,
      builder: (context, isChanged, child) {
        if (!isChanged) return const SizedBox.shrink();

        return ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              FocusScope.of(context).unfocus();
              controller.updateField();
              controller.isChanged.value = false;
            }
          },
          child: const Text('Сохранить'),
        );
      },
    );
  }
}
