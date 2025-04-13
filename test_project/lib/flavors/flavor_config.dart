/// Перечисление вариантов сборки (реализован пока что только dev)
enum Flavor { dev, prod }

class FlavorConfig {
  final Flavor flavor;
  final String name;

  static late FlavorConfig _instance;

  factory FlavorConfig({
    required Flavor flavor,
    required String name,
  }) {
    _instance = FlavorConfig._internal(flavor, name);
    return _instance;
  }

  FlavorConfig._internal(this.flavor, this.name);

  static FlavorConfig get instance => _instance;

  static bool isDev() => _instance.flavor == Flavor.dev;
  static bool isProd() => _instance.flavor == Flavor.prod;
}
