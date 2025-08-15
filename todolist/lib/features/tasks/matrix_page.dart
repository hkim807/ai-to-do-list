import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../design_system/components/eisenhower_matrix.dart'
  show DsEisenhowerMatrix, DsMatrixTask;
import '../../design_system/components/task_composer.dart';
import '../../design_system/tokens/spacing.dart';
import '../../design_system/tokens/typography_tokens.dart';
import 'task_store.dart';

class MatrixPage extends StatefulWidget {
  const MatrixPage({super.key});

  @override
  State<MatrixPage> createState() => _MatrixPageState();
}

class _MatrixPageState extends State<MatrixPage> {
  double? _pendingU;
  double? _pendingI;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final store = context.watch<TaskStore>();

    final dsTasks = store.tasks.map((t) => DsMatrixTask(
      id: t.id,
      title: t.title,
      urgency: t.urgency.clamp(0, 1),
      importance: t.importance.clamp(0, 1),
      color: t.completed ? cs.surfaceVariant : null,
    )).toList();

    return Column(
      children: [
        if (_pendingU != null && _pendingI != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: _HintBar(
              text: 'New task at u=${_pendingU!.toStringAsFixed(2)}, i=${_pendingI!.toStringAsFixed(2)}',
              onClear: () => setState(() { _pendingU = _pendingI = null; }),
            ),
          ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: AspectRatio(
              aspectRatio: 1,
              child: DsEisenhowerMatrix(
                tasks: dsTasks,
                onTaskMoved: (id, u, i) => context.read<TaskStore>().updatePosition(
                  id: id, urgency: u, importance: i,
                ),
                onLongPressBlank: (u, i) => setState(() {
                  _pendingU = u; _pendingI = i;
                }),
              ),
            ),
          ),
        ),
   
      ],
    );
  }
}

class _HintBar extends StatelessWidget {
  const _HintBar({required this.text, required this.onClear});
  final String text;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: cs.outlineVariant),
      ),
      child: Row(
        children: [
          Expanded(child: Text(text)),
          IconButton(onPressed: onClear, icon: const Icon(Icons.close)),
        ],
      ),
    );
  }
}