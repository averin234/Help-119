import 'package:get/get.dart';
import 'package:kreki119/app/modules/main/controllers/main_controller.dart';

class BottomNavController extends GetxController {

  final MainController mainController = Get.find<MainController>();

  final _selectedIndexController = 0.obs;

  updateSelectedIndex(int index) => _selectedIndexController(index);

  int get selectedIndex => _selectedIndexController.value;
}
