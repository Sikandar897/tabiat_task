

import '../../src.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController controller = Get.find<TaskController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabiat App Task'),
        actions: [
          IconButton(
            tooltip: 'Clear all',
            icon: const Icon(Icons.clear_all),
            onPressed: () {
              if (controller.tasks.isEmpty) {
                Get.snackbar('Info', 'No tasks to clear', snackPosition: SnackPosition.BOTTOM);
              } else {
                Get.defaultDialog(
                  title: 'Clear all tasks',
                  middleText: 'Remove all tasks?',
                  textCancel: 'No',
                  textConfirm: 'Yes',
                  confirmTextColor: Colors.white,
                  onConfirm: () {
                    controller.tasks.clear();
                    Get.back();
                    Get.snackbar('Cleared', 'All tasks removed', snackPosition: SnackPosition.BOTTOM);
                  },
                );
              }
            },
          ),
        ],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        final isWide = ResponsiveHelper.isWideScreen(constraints);
        final horizontalPadding = ResponsiveHelper.horizontalPadding(constraints);

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 16),
          child: Column(
            children: [
              if (isWide)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Your tasks', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    SizedBox.shrink()
                  ],
                )
              else
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Your tasks', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              const SizedBox(height: 12),
              TaskInputField(),
              const SizedBox(height: 16),
              Expanded(
                child: Obx(() {
                  final tasks = controller.tasks;
                  if (tasks.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.inbox_outlined, size: 64, color: Colors.black26),
                          SizedBox(height: 12),
                          Text('No tasks yet', style: TextStyle(fontSize: 16, color: Colors.black54)),
                          SizedBox(height: 6),
                          Text('Add your first task using the box above.', style: TextStyle(color: Colors.black45)),
                        ],
                      ),
                    );
                  }

                  return Scrollbar(
                    thumbVisibility: true,
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];
                        return TaskTile(task: task);
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      }),
    );
  }
}
