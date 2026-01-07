import 'package:project_template/core/network/api_client.dart';
import 'package:project_template/core/network/api_constants.dart';
import 'package:project_template/core/network/models.dart';

/// An example service showing how to use the organized [ApiClient]
class SampleService {
  SampleService(this._apiClient);

  final ApiClient _apiClient;

  /// Example of a GET request with automatic loading state
  Future<ApiResponse<Map<String, dynamic>>> getUserProfile() async {
    return _apiClient.get(
      ApiConstants.profile,
      showLoader: true, // Shows the global SpinKitCircle dialog
    );
  }

  /// Example of a POST request with data
  Future<ApiResponse<Map<String, dynamic>>> login(
    String email,
    String password,
  ) async {
    return _apiClient.post(
      ApiConstants.login,
      data: {'email': email, 'password': password},
      showLoader: true,
    );
  }

  /// Example of a request without a loader (background sync) using the generic request method
  Future<ApiResponse<void>> updateLastSeen() async {
    return _apiClient.request(
      path: '/user/last-seen',
      method: 'PATCH',
      showLoader: false, // UI won't be blocked
    );
  }
}
