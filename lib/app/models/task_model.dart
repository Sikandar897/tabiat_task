class TaskModel {
  final String id;
  final String title;
  final DateTime createdAt;

  TaskModel({
    required this.id,
    required this.title,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
  String normalizedTitle() => title.trim().toLowerCase();
}
