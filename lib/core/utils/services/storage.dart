import 'package:get_storage/get_storage.dart';

class Storage {
  Storage() {
    storage = GetStorage();
  }
  // static const String _refreshToken = 'refreshToken';
  static const _jwtToken = 'jwtToken';
  static const String _isLoggedIn = 'isLoggedIn';
  static const String _locale = 'locale';
  static const _fcmToken = 'fcmToken';
  static const _onBoardingVisible = 'onBoardingVisible';
  static const _phoneNumber = 'phoneNumber';
  static const _firstName = 'firstName';
  static const _lastName = 'lastName';
  static const _userId = 'userId';
  static const _email = 'email';

  late GetStorage storage;

  Future<void> remove(String key) async {
    await storage.remove(key);
  }

  void write(String key, dynamic value) {
    storage.write(key, value);
  }

  T? read<T>(String key) {
    return storage.read<T>(key);
  }

  Future<void> erase() async {
    await storage.erase();
    fcmToken = '';
  }

  bool get isLoggedIn => storage.read<bool>(_isLoggedIn) ?? false;
  set isLoggedIn(bool newValue) => storage.write(_isLoggedIn, newValue);

  String? get fcmToken => storage.read<String>(_fcmToken);
  set fcmToken(String? newValue) => storage.write(_fcmToken, newValue);

  String? get jwtToken => storage.read<String>(_jwtToken);
  set jwtToken(String? newValue) => storage.write(_jwtToken, newValue);

  String? get locale => storage.read<String>(_locale);
  set locale(String? newValue) => storage.write(_locale, newValue);

  String? get phoneNumber => storage.read<String>(_phoneNumber);
  set phoneNumber(String? newValue) => storage.write(_phoneNumber, newValue);

  String? get fistName => storage.read<String>(_firstName);
  set fistName(String? newValue) => storage.write(_firstName, newValue);

  String? get lastName => storage.read<String>(_lastName);
  set lastName(String? newValue) => storage.write(_lastName, newValue);

  num? get userId => storage.read<num>(_userId);
  set userId(num? newValue) => storage.write(_userId, newValue);

  String? get email => storage.read<String>(_email);
  set email(String? newValue) => storage.write(_email, newValue);

  bool get onBoardingVisible => storage.read<bool>(_onBoardingVisible) ?? false;
  set onBoardingVisible(bool newValue) =>
      storage.write(_onBoardingVisible, newValue);
}
