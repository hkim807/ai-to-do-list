import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:todolist/design_system/components/eisenhower_matrix.dart';
import 'package:todolist/design_system/components/task_composer.dart';

@widgetbook.UseCase(name: 'Matrix - Basic', type: Scaffold)
Widget matrixBasic(BuildContext context) {
  final tasks = [
    DsMatrixTask(
      id: '1',
      title: 'Product Review',
      urgency: 0.25,
      importance: 0.25,
    ),
    DsMatrixTask(
      id: '2',
      title: 'Product Review',
      urgency: 0.75,
      importance: 0.2,
    ),
    DsMatrixTask(
      id: '3',
      title: 'Product Review',
      urgency: 0.25,
      importance: 0.75,
    ),
    DsMatrixTask(
      id: '4',
      title: 'Product Review',
      urgency: 0.7,
      importance: 0.7,
    ),
  ];

  return Scaffold(
    backgroundColor: const Color(0xFFF7F4ED),
    body: Padding(
      padding: const EdgeInsets.all(24),
      child: AspectRatio(
        aspectRatio: 1,
        child: DsEisenhowerMatrix(
          tasks: tasks,
          onTaskMoved: (id, u, i) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Moved $id to u=${u.toStringAsFixed(2)}, i=${i.toStringAsFixed(2)}',
                ),
              ),
            );
          },
          onLongPressBlank: (u, i) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Create new at u=${u.toStringAsFixed(2)}, i=${i.toStringAsFixed(2)}',
                ),
              ),
            );
          },
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Matrix - With Composer', type: Scaffold)
Widget matrixWithComposer(BuildContext context) {
  final tasks = [
    DsMatrixTask(
      id: '1',
      title: 'Product Review',
      urgency: 0.2,
      importance: 0.8,
    ),
    DsMatrixTask(
      id: '2',
      title: 'Product Review',
      urgency: 0.8,
      importance: 0.2,
    ),
  ];

  double? pendingU;
  double? pendingI;

  return StatefulBuilder(
    builder: (context, setState) => Scaffold(
      backgroundColor: const Color(0xFFF7F4ED),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: DsEisenhowerMatrix(
                tasks: tasks,
                onLongPressBlank: (u, i) {
                  setState(() {
                    pendingU = u;
                    pendingI = i;
                  });
                },
              ),
            ),
          ),
          if (pendingU != null && pendingI != null)
            DsTaskComposer(
              initialPriority: _priorityFromU(pendingU!),
              initialDate: null,
              onSend: (text, date, priority) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Create "$text" at u=${pendingU!.toStringAsFixed(2)}, i=${pendingI!.toStringAsFixed(2)}',
                    ),
                  ),
                );
                setState(() {
                  pendingU = null;
                  pendingI = null;
                });
              },
            ),
        ],
      ),
    ),
  );
}

DsPriority _priorityFromU(double u) {
  if (u >= 0.67) return DsPriority.high;
  if (u >= 0.33) return DsPriority.medium;
  return DsPriority.low;
}
