import 'package:get/get.dart';
import 'package:project_template/core/utils/storage/storage.dart';
import 'sample_service.dart';

/// An example controller showing how to use the service
class SampleController extends GetxController {
  final SampleService _sampleService;
  final Storage _storage;

  SampleController(this._sampleService, this._storage);

  final userProfile = Rxn<Map<String, dynamic>>();

  /// Calls the service and handles the result
  Future<void> fetchProfile() async {
    try {
      // The loader is handled INSIDE the service via safeApiCall
      final response = await _sampleService.getUserProfile();

      if (response.success) {
        userProfile.value = response.data;
        Get.snackbar('Success', 'Profile loaded successfully');
      }
    } catch (e) {
      // No need to show an error snackbar here!
      // The ErrorInterceptor already caught the DioException and showed a UI message.
      print('Controller caught error: $e');
    }
  }

  /// Login example
  Future<void> performLogin() async {
    try {
      final response = await _sampleService.login('test@example.com', '123456');

      if (response.success && response.data != null) {
        // Save token to storage
        final token = response.data!['token'];
        _storage.jwtToken = token;
        _storage.isLoggedIn = true;

        Get.offAllNamed('/home');
      }
    } catch (e) {
      // Error is already handled by interceptors
    }
  }
}
