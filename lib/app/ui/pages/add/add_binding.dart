import 'package:get/get.dart';
import 'package:research_support_tool/app/ui/pages/add/add_controller.dart';

class AddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddController());
  }
}