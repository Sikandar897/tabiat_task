import '../../src.dart';

class TaskInputField extends StatelessWidget {
  final TaskController controller = Get.find<TaskController>();

  TaskInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller.inputController,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) {
              
              if (controller.inputController.text.trim().isNotEmpty) {
                controller.addTask();
              }
            },
            maxLines: 1,
            decoration: const InputDecoration(
              hintText: 'Add a new task...',
              border: OutlineInputBorder(),
              isDense: true,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Obx(() {
          final enabled = controller.inputController.text.trim().isNotEmpty;
          return ElevatedButton(
            onPressed: enabled ? controller.addTask : null,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
              child: Text('Add'),
            ),
          );
        }),
      ],
    );
  }
}
