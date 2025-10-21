import '../../src.dart';

class TaskController extends GetxController {
  final RxList<TaskModel> tasks = <TaskModel>[].obs;
  final TextEditingController inputController = TextEditingController();
  final _uuid = const Uuid();
  RxBool get isInputNotEmpty => (inputController.text.trim().isNotEmpty).obs;

  @override
  void onInit() {
    super.onInit();
    inputController.addListener(() {
      update();
    });
  }

  @override
  void onClose() {
    inputController.dispose();
    super.onClose();
  }

  bool _isDuplicate(String title) {
    final norm = title.trim().toLowerCase();
    return tasks.any((t) => t.normalizedTitle() == norm);
  }

  void addTask() {
    final text = inputController.text.trim();
    if (text.isEmpty) {
      Get.snackbar('Warning', 'Task cannot be empty',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (_isDuplicate(text)) {
      Get.snackbar('Duplicate', 'This task already exists',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    final newTask = TaskModel(id: _uuid.v4(), title: text);
    tasks.insert(0, newTask); 
    inputController.clear();
    Get.snackbar('Added', 'Task added successfully',
        snackPosition: SnackPosition.BOTTOM);
  }

  void removeTask(String id) {
    final removed = tasks.firstWhereOrNull((t) => t.id == id);
    if (removed != null) {
      tasks.removeWhere((t) => t.id == id);
      Get.snackbar('Removed', 'Task removed',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Not found', 'Could not find the task to remove',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void clearAll() {
    if (tasks.isEmpty) {
      Get.snackbar('Empty', 'No tasks to clear', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    tasks.clear();
    Get.snackbar('Cleared', 'All tasks removed', snackPosition: SnackPosition.BOTTOM);
  }
}
