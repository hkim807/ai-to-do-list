import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../design_system/components/accordion.dart';
import '../../design_system/tokens/spacing.dart';
import '../../design_system/tokens/typography_tokens.dart';
import 'task_store.dart';
import 'task_model.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.watch<TaskStore>();
    final tasks = store.tasks;

    // Group by quadrant
    final map = <Quadrant, List<_RowData>>{
      Quadrant.urgentImportant: [],
      Quadrant.notUrgentImportant: [],
      Quadrant.urgentNotImportant: [],
      Quadrant.notUrgentNotImportant: [],
    };

    for (final t in tasks) {
      map[t.quadrant]!.add(_RowData(id: t.id, title: t.title, done: t.completed));
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 120),
      children: [
        _section(context,
          title: 'Urgent & Important',
          tint: const Color(0xFFFF6B6B),
          rows: map[Quadrant.urgentImportant]!,
          onToggle: (id) => store.toggleDone(id),
        ),
        _section(context,
          title: 'Not Urgent & Important',
          tint: const Color(0xFFFFC857),
          rows: map[Quadrant.notUrgentImportant]!,
          onToggle: (id) => store.toggleDone(id),
        ),
        _section(context,
          title: 'Urgent & Not Important',
          tint: const Color(0xFFF7F6F3),
          rows: map[Quadrant.urgentNotImportant]!,
          onToggle: (id) => store.toggleDone(id),
        ),
        _section(context,
          title: 'Not Urgent & Not Important',
          tint: const Color(0xFFF7F6F3),
          rows: map[Quadrant.notUrgentNotImportant]!,
          onToggle: (id) => store.toggleDone(id),
        ),
      ],
    );
  }

  Widget _section(
    BuildContext context, {
    required String title,
    required Color tint,
    required List<_RowData> rows,
    required void Function(String id) onToggle,
  }) {
    final cs = Theme.of(context).colorScheme;

    // If your Accordion API differs, adjust props here.
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DsAccordionSection(
        title: title,
        children: rows.isEmpty
            ? [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text('Nothing here yet',
                      style: TypographyTokens.subtitle(cs.onSurface)),
                ),
              ]
            : [
                for (final r in rows)
                  ListTile(
                    dense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    leading: Checkbox(
                      value: r.done,
                      onChanged: (_) => onToggle(r.id),
                    ),
                    title: Text(
                      r.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TypographyTokens.body(cs.onSurface),
                    ),
                  ),
              ],
      ),
    );
  }
}

class _RowData {
  _RowData({required this.id, required this.title, required this.done});
  final String id;
  final String title;
  final bool done;
}