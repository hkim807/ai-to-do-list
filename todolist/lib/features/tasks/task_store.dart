import 'package:flutter/foundation.dart';
import 'task_model.dart';

class TaskStore extends ChangeNotifier {
  TaskStore();

  List<Task> _tasks = <Task>[
    Task(id: 't1', title: 'Product review', urgency: .82, importance: .88),
    Task(id: 't2', title: 'Email follow‑ups', urgency: .70, importance: .40),
    Task(id: 't3', title: 'Gym session', urgency: .28, importance: .72),
    Task(id: 't4', title: 'Shopping list', urgency: .20, importance: .25),
  ];

  List<Task> get tasks => List.unmodifiable(_tasks);

  Future<void> load() async {
    // TODO: replace with repository call later
    notifyListeners();
  }

  Future<void> addQuickTask(String title, {double urgency = .5, double importance = .6}) async {
    final t = Task(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: title.trim(),
      urgency: urgency.clamp(0, 1),
      importance: importance.clamp(0, 1),
    );
    _tasks = [..._tasks, t];
    notifyListeners();
    // TODO: persist via repository
  }

  Future<void> updatePosition({
    required String id,
    required double urgency,
    required double importance,
  }) async {
    final i = _tasks.indexWhere((t) => t.id == id);
    if (i == -1) return;

    final updated = List<Task>.from(_tasks);
    updated[i] = updated[i].copyWith(
      urgency: urgency.clamp(0, 1),
      importance: importance.clamp(0, 1),
    );
    _tasks = updated;
    notifyListeners();
  }

  Future<void> toggleDone(String id) async {
    final i = _tasks.indexWhere((t) => t.id == id);
    if (i == -1) return;

    final updated = List<Task>.from(_tasks);
    updated[i] = updated[i].copyWith(completed: !updated[i].completed);
    _tasks = updated;
    notifyListeners();
  }
}