import 'package:flutter/material.dart';
import 'package:test_project/core/router/app_router.dart';
import 'package:test_project/core/theme/theme_builder.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'shop',
      theme: ThemeBuilder.themeData,
    );
  }
}
