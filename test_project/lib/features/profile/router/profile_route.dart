import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project/features/profile/profile_page.dart';

class ProfileRoute extends GoRouteData {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProfilePage();
}
