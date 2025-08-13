import 'package:flutter/material.dart';

class DsMatrixTask {
  DsMatrixTask({
    required this.id,
    required this.title,
    required this.urgency,
    required this.importance,
    this.color,
  });
  final String id;
  final String title;
  final double urgency; // 0..1 (x-axis)
  final double importance; // 0..1 (y-axis)
  final Color? color;

  DsMatrixTask copyWith({
    String? id,
    String? title,
    double? urgency,
    double? importance,
    Color? color,
  }) => DsMatrixTask(
    id: id ?? this.id,
    title: title ?? this.title,
    urgency: urgency ?? this.urgency,
    importance: importance ?? this.importance,
    color: color ?? this.color,
  );
}

class DsEisenhowerMatrix extends StatefulWidget {
  const DsEisenhowerMatrix({
    super.key,
    required this.tasks,
    this.onTaskMoved,
    this.onLongPressBlank,
    this.padding = const EdgeInsets.all(12),
  });

  final List<DsMatrixTask> tasks;
  final void Function(String id, double urgency, double importance)?
  onTaskMoved;
  final void Function(double urgency, double importance)? onLongPressBlank;
  final EdgeInsets padding;

  @override
  State<DsEisenhowerMatrix> createState() => _DsEisenhowerMatrixState();
}

class _DsEisenhowerMatrixState extends State<DsEisenhowerMatrix> {
  final GlobalKey _stackKey = GlobalKey();
  late List<DsMatrixTask> _localTasks; // Add this line

  @override
  void initState() {
    super.initState();
    _localTasks = List.from(widget.tasks); // Add this line
  }

  @override
  void didUpdateWidget(DsEisenhowerMatrix oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tasks != widget.tasks) {
      _localTasks = List.from(widget.tasks); // Add this line
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final contentRect = Rect.fromLTWH(
          widget.padding.left,
          widget.padding.top,
          width - widget.padding.horizontal,
          height - widget.padding.vertical,
        );

        return GestureDetector(
          onLongPressStart: (d) {
            final local = _toLocalIn(contentRect, d.localPosition);
            if (local == null) return;
            final normalized = _toNormalized(contentRect, d.localPosition);
            if (normalized == null) return;
            widget.onLongPressBlank?.call(normalized.dx, normalized.dy);
          },
          child: Stack(
            key: _stackKey,
            children: [
              // Background with quadrants
              Positioned.fill(
                child: CustomPaint(
                  painter: _MatrixPainter(cs: cs, padding: widget.padding),
                ),
              ),

              // Task chips
              ..._localTasks.map((t) {
                // Change from widget.tasks to _localTasks
                final pos = _fromNormalized(
                  contentRect,
                  Offset(t.urgency, t.importance),
                );
                return Positioned(
                  left: pos.dx - 48,
                  top: pos.dy - 14,
                  child: _DraggableChip(
                    label: t.title,
                    color: t.color ?? cs.surfaceVariant,
                    onDragEnd: (local) {
                      final normalized = _toNormalized(contentRect, local);
                      if (normalized == null) return;
                      _onTaskMoved(
                        t.id,
                        normalized.dx,
                        normalized.dy,
                      ); // Change this line
                    },
                  ),
                );
              }),

              // Axis labels
              Positioned(
                left: 8,
                top: height / 2 - 40,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    'Importance',
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(color: cs.onSurface),
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                left: width / 2 - 40,
                child: Text(
                  'Urgency',
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge?.copyWith(color: cs.onSurface),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Offset _fromNormalized(Rect rect, Offset norm) {
    final clamped = Offset(norm.dx.clamp(0, 1), norm.dy.clamp(0, 1));
    return Offset(
      rect.left + clamped.dx * rect.width,
      rect.top + clamped.dy * rect.height,
    );
  }

  Offset? _toNormalized(Rect rect, Offset localPoint) {
    if (!rect.contains(localPoint)) return null;
    final dx = (localPoint.dx - rect.left) / rect.width;
    final dy = (localPoint.dy - rect.top) / rect.height;
    return Offset(dx.clamp(0, 1), dy.clamp(0, 1));
  }

  Offset? _toLocalIn(Rect rect, Offset localPoint) =>
      rect.contains(localPoint) ? localPoint : null;

  void _onTaskMoved(String id, double urgency, double importance) {
    final index = _localTasks.indexWhere((t) => t.id == id);
    if (index != -1) {
      setState(() {
        _localTasks[index] = _localTasks[index].copyWith(
          urgency: urgency,
          importance: importance,
        );
      });
      widget.onTaskMoved?.call(id, urgency, importance);
    }
  }
}

class _DraggableChip extends StatefulWidget {
  const _DraggableChip({
    required this.label,
    required this.color,
    required this.onDragEnd,
  });
  final String label;
  final Color color;
  final void Function(Offset localPosition) onDragEnd;

  @override
  State<_DraggableChip> createState() => _DraggableChipState();
}

class _DraggableChipState extends State<_DraggableChip> {
  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return GestureDetector(
      onPanUpdate: (d) => setState(() => _offset += d.delta),
      onPanEnd: (d) {
        // Get the final position in the parent's coordinate system
        final renderBox = context.findRenderObject() as RenderBox;
        final parentBox = context.findAncestorRenderObjectOfType<RenderBox>();
        if (parentBox != null) {
          final globalPos = renderBox.localToGlobal(Offset.zero) + _offset;
          final localPos = parentBox.globalToLocal(globalPos);
          widget.onDragEnd(localPos);
        }
        setState(() => _offset = Offset.zero);
      },
      child: Transform.translate(
        offset: _offset,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: cs.outline.withOpacity(0.3)),
          ),
          child: Text(widget.label, style: TextStyle(color: cs.onSurface)),
        ),
      ),
    );
  }
}

class _MatrixPainter extends CustomPainter {
  _MatrixPainter({required this.cs, required this.padding});
  final ColorScheme cs;
  final EdgeInsets padding;

  @override
  void paint(Canvas canvas, Size size) {
    final rect =
        Offset(padding.left, padding.top) &
        Size(size.width - padding.horizontal, size.height - padding.vertical);
    final paintBorder = Paint()
      ..color = cs.outline
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final paintDashed = Paint()
      ..color = cs.outline.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // Quadrant background colors (very light tints)
    final qW = rect.width / 2;
    final qH = rect.height / 2;
    final tints = [
      const Color(0xFFFFFBEB), // top-left
      const Color(0xFFFFE4E6), // top-right
      const Color(0xFFEFFBF1), // bottom-left
      const Color(0xFFE0F2FE), // bottom-right
    ];
    final quads = [
      Rect.fromLTWH(rect.left, rect.top, qW, qH),
      Rect.fromLTWH(rect.left + qW, rect.top, qW, qH),
      Rect.fromLTWH(rect.left, rect.top + qH, qW, qH),
      Rect.fromLTWH(rect.left + qW, rect.top + qH, qW, qH),
    ];
    for (int i = 0; i < 4; i++) {
      final r = quads[i];
      final bg = Paint()..color = tints[i];
      canvas.drawRRect(
        RRect.fromRectAndRadius(r, const Radius.circular(8)),
        bg,
      );
    }

    // Outer border
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(10)),
      paintBorder,
    );

    // Center dashed lines
    _drawDashedLine(
      canvas,
      Offset(rect.left + qW, rect.top),
      Offset(rect.left + qW, rect.bottom),
      paintDashed,
    );
    _drawDashedLine(
      canvas,
      Offset(rect.left, rect.top + qH),
      Offset(rect.right, rect.top + qH),
      paintDashed,
    );
  }

  void _drawDashedLine(Canvas canvas, Offset p1, Offset p2, Paint paint) {
    const dash = 6.0;
    const gap = 6.0;
    final total = (p2 - p1).distance;
    final dir = (p2 - p1) / total;
    double cur = 0;
    while (cur < total) {
      final s = p1 + dir * cur;
      final e = p1 + dir * (cur + dash).clamp(0, total);
      canvas.drawLine(s, e, paint);
      cur += dash + gap;
    }
  }

  @override
  bool shouldRepaint(covariant _MatrixPainter oldDelegate) => false;
}
