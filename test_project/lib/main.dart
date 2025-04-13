import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/core/router/app_router.dart';
import 'package:test_project/core/theme/theme_builder.dart';
import 'package:test_project/flavors/flavor_config.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.dev,
    name: "Dev",
  );

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'My App',
      theme: ThemeBuilder.themeData,
    );
  }
}
