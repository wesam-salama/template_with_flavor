class ApiConstants {
  const ApiConstants._();

  static const String baseUrl = 'https://example.com/api/v1';

  // Auth Endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String sendOtp = '/otp/send';

  // User Endpoints
  static const String profile = '/user/profile';
}
