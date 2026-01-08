import 'package:flutter_dotenv/flutter_dotenv.dart';

class SystemConfig {
  const SystemConfig._();

  static String keyGoogleMap = dotenv.env['KEY_GOOGLE_MAP'].toString();
}
