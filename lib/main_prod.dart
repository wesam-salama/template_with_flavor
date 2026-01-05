import 'package:project_template/flavor/flavor_config.dart';
import 'package:project_template/main_common.dart';

void main() {
  mainCommon(
    flavor: Flavor.prod,
    name: "Prod",
    baseUrl: "https://prod.example.com",
  );
}
