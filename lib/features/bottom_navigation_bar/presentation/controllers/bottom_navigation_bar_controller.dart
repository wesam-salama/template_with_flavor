import 'package:get/get.dart';

/// Controller for managing the state of the Bottom Navigation Bar.
class BottomNavigationBarController extends GetxController {
  BottomNavigationBarController();

  @override
  void onInit() {
    super.onInit();
  }

  final _currentBottomNavigationBarIndex = RxInt(0);
  int get currentBottomNavigationBarIndex =>
      _currentBottomNavigationBarIndex.value;

  set currentBottomNavigationBarIndex(int newValue) {
    _currentBottomNavigationBarIndex.value = newValue;
    update();
  }
}
