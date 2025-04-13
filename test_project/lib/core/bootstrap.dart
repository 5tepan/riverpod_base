import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/app.dart';
import 'package:test_project/flavors/flavor_config.dart';

/// Точка входа, где можно позже подключить Firebase, dotenv, logging и т.д
Future<void> bootstrap({
  required Flavor flavor,
  required String flavorName,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  FlavorConfig(
    flavor: flavor,
    name: flavorName,
  );

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}
