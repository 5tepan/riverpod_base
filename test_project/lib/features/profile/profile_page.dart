import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/base/base_page.dart';
import 'package:test_project/core/theme/theme_builder.dart';
import 'package:test_project/features/profile/entities/user_profile.dart';
import 'package:test_project/features/profile/presentation/controllers/profile_controller.dart';
import 'package:test_project/features/profile/presentation/widgets/profile_form_widget.dart';

class ProfilePage extends BaseAsyncPage<UserProfile> {
  const ProfilePage({
    super.key,
    super.title = 'Профиль',
  });

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends BaseAsyncPageState<ProfilePage, UserProfile> {
  @override
  Color? backgroundColor() => AppColors.lightPlatinum;

  @override
  AsyncValue<UserProfile> buildProvider(WidgetRef ref) {
    return ref.watch(profileControllerProvider);
  }

  @override
  Widget buildContent(BuildContext context, UserProfile data) {
    final controller = ref.read(profileControllerProvider.notifier);
    return ProfileFormWidget(
      user: data,
      controller: controller,
    );
  }
}
