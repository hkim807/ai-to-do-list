enum Quadrant { urgentImportant, notUrgentImportant, urgentNotImportant, notUrgentNotImportant }

class Task {
  Task({
    required this.id,
    required this.title,
    required this.urgency,      // 0..1, x-axis
    required this.importance,   // 0..1, y-axis
    this.completed = false,
  });

  final String id;
  final String title;
  final double urgency;
  final double importance;
  final bool completed;

  Quadrant get quadrant {
    final u = urgency >= 0.5;
    final i = importance >= 0.5;
    if (u && i) return Quadrant.urgentImportant;
    if (!u && i) return Quadrant.notUrgentImportant;
    if (u && !i) return Quadrant.urgentNotImportant;
    return Quadrant.notUrgentNotImportant;
  }

  Task copyWith({
    String? title,
    double? urgency,
    double? importance,
    bool? completed,
  }) => Task(
    id: id,
    title: title ?? this.title,
    urgency: urgency ?? this.urgency,
    importance: importance ?? this.importance,
    completed: completed ?? this.completed,
  );
}