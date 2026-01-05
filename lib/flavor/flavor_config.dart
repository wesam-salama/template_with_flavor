enum Flavor { dev, stage, prod }

// Create FlavorConfig as singleton class
class FlavorConfig {
  final Flavor flavor;
  final String name;
  final String baseUrl;

  const FlavorConfig._({
    required this.flavor,
    required this.name,
    required this.baseUrl,
  });

  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    required String name,
    required String baseUrl,
  }) {
    _instance ??= FlavorConfig._(flavor: flavor, name: name, baseUrl: baseUrl);
    return _instance!;
  }

  static FlavorConfig get instance {
    if (_instance == null) {
      throw Exception("FlavorConfig has not been initialized");
    }
    return _instance!;
  }

  static bool isDev() => instance.flavor == Flavor.dev;
  static bool isStage() => instance.flavor == Flavor.stage;
  static bool isProd() => instance.flavor == Flavor.prod;
}
