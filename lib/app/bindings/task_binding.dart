import 'package:get/get.dart';

class TaskBinding extends Bindings {
  @override
  void dependencies() {
    // Using lazyPut so controller is only created when needed.
    Get.lazyPut<TaskController>(() => TaskController());
  }
}
