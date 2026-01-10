import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:project_template/core/storage/storage.dart';
import 'package:project_template/core/network/api_client.dart';
import 'package:project_template/core/network/page_loading_dialog.dart';
import 'package:project_template/core/network/api_constants.dart';

import '../../features/bottom_navigation_bar/presentation/controllers/bottom_navigation_bar_controller.dart';
import '../controllers/main_controller.dart';
import '../themes/controllers/theme_controller.dart';
import '../localization/controllers/localization_controller.dart';
import '../widgets/show_bottom_sheet/i_show_bottom_sheet.dart';
import '../widgets/show_bottom_sheet/show_bottom_sheet_impl.dart';
import '../widgets/show_dialog_helper/i_show_dialog_helper.dart';
import '../widgets/show_dialog_helper/show_dialog_impl.dart';
import '../widgets/show_snack_bar/i_show_snackbar.dart';
import '../widgets/show_snack_bar/show_get_snackbar_impl.dart';
import '../notification/i_firebase_messaging.dart';
import '../notification/firebase_messaging_impl.dart';

/// Binds dependencies needed at the start of the application.
class MainBinding extends Bindings {
  @override
  void dependencies() {
    // Core
    Get.put(ThemeController());
    Get.put(Storage());

    // Network
    Get.lazyPut(() => Dio(BaseOptions(baseUrl: ApiConstants.baseUrl)));
    Get.lazyPut<IPageLoadingDialog>(() => PageLoadingDialog());

    Get.lazyPut(
      () => ApiClient(
        dio: Get.find<Dio>(),
        storage: Get.find<Storage>(),
        loadingDialog: Get.find<IPageLoadingDialog>(),
      ),
    );

    // Translation
    Get.put(LocalizationController(Get.find<Storage>()), permanent: true);

    // Global Controllers
    Get.put(MainController(), permanent: true);
    Get.put(BottomNavigationBarController(), permanent: true);

    // Widgets
    Get.put<IShowDialogHelper>(ShowDialogHelperImpl(), permanent: true);
    Get.put<IShowBottomSheetHelper>(
      ShowBottomSheetHelperImpl(),
      permanent: true,
    );
    Get.put<IShowSnakBar>(ShowSnakBarImpl(), permanent: true);
  }
}
