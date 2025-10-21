

import '../../src.dart';

class TaskTile extends StatelessWidget {
  final TaskModel task;
  final TaskController controller = Get.find<TaskController>();

  TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final titleWidget = LayoutBuilder(builder: (context, constraints) {
      final text = Text(
        task.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 16),
      );
      if (task.title.length > 40) {
        return Tooltip(
          message: task.title,
          child: text,
        );
      }
      return text;
    });

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        title: titleWidget,
        subtitle: Text(
          '${task.createdAt.hour.toString().padLeft(2, '0')}:${task.createdAt.minute.toString().padLeft(2, '0')} • ${task.createdAt.year}-${task.createdAt.month.toString().padLeft(2, '0')}-${task.createdAt.day.toString().padLeft(2, '0')}',
          style: const TextStyle(fontSize: 12),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline),
          tooltip: 'Delete',
          onPressed: () {
            Get.defaultDialog(
              title: 'Delete task',
              middleText: 'Are you sure you want to delete this task?',
              textCancel: 'Cancel',
              textConfirm: 'Delete',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
                controller.removeTask(task.id);   
              },
            );
          },
        ),
      ),
    );
  }
}
