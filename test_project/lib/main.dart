import 'package:test_project/core/bootstrap.dart';
import 'package:test_project/flavors/flavor_config.dart';

void main() {
  bootstrap(
    flavor: Flavor.dev,
    flavorName: 'Dev',
  );
}
