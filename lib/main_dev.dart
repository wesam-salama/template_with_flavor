import 'package:project_template/flavor/flavor_config.dart';
import 'package:project_template/main_common.dart';

void main() {
  mainCommon(
    flavor: Flavor.dev,
    name: "Dev",
    baseUrl: "https://dev.example.com",
  );
}
