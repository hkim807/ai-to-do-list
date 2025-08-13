import 'package:flutter/material.dart';

enum DsPriority { high, medium, low, none }

class DsTaskComposer extends StatefulWidget {
  const DsTaskComposer({
    super.key,
    this.initialText,
    this.initialDate,
    this.initialPriority = DsPriority.none,
    this.onChanged,
    this.onSend,
    this.onMicPressed,
    this.onDateChanged,
    this.onPriorityChanged,
  });

  final String? initialText;
  final DateTime? initialDate;
  final DsPriority initialPriority;
  final ValueChanged<String>? onChanged;
  final void Function(String text, DateTime? date, DsPriority priority)? onSend;
  final VoidCallback? onMicPressed;
  final ValueChanged<DateTime?>? onDateChanged;
  final ValueChanged<DsPriority>? onPriorityChanged;

  @override
  State<DsTaskComposer> createState() => _DsTaskComposerState();
}

class _DsTaskComposerState extends State<DsTaskComposer> {
  late final TextEditingController _controller;
  DateTime? _date;
  late DsPriority _priority;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText ?? '');
    _date = widget.initialDate;
    _priority = widget.initialPriority;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF7F6F2),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Row(
            children: [
              // Date chip
              _buildDateChip(context),
              const SizedBox(width: 8),
              // Priority chip
              _buildPriorityChip(context),
              const SizedBox(width: 8),
              // Text input
              Expanded(child: _buildTextField(context)),
              const SizedBox(width: 8),
              // Action (mic or send)
              _buildActionButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cs.outline.withOpacity(0.5)),
      ),
      child: TextField(
        controller: _controller,
        decoration: const InputDecoration(
          hintText: 'Add a task…',
          border: InputBorder.none,
        ),
        onChanged: (v) {
          setState(() {});
          widget.onChanged?.call(v);
        },
        textInputAction: TextInputAction.send,
        onSubmitted: (v) => _handleSend(),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context) {
    final hasText = _controller.text.trim().isNotEmpty;
    final cs = Theme.of(context).colorScheme;
    return Material(
      color: hasText ? cs.primary : Colors.white,
      shape: const CircleBorder(),
      elevation: 0,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: hasText ? _handleSend : widget.onMicPressed,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(
            hasText ? Icons.arrow_upward : Icons.mic,
            color: hasText ? Colors.white : cs.onSurface,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildDateChip(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final hasDate = _date != null;
    return InkWell(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: _date ?? DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
        );
        if (picked != null) {
          setState(() => _date = picked);
          widget.onDateChanged?.call(picked);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: cs.outline.withOpacity(0.5)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.calendar_today, size: 18, color: cs.onSurface),
            const SizedBox(width: 8),
            Text(
              hasDate ? _formatDate(_date!) : 'Today',
              style: TextStyle(color: cs.onSurface),
            ),
            if (hasDate) ...[
              const SizedBox(width: 6),
              GestureDetector(
                onTap: () {
                  setState(() => _date = null);
                  widget.onDateChanged?.call(null);
                },
                child: Icon(
                  Icons.close,
                  size: 14,
                  color: cs.onSurface.withOpacity(0.7),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPriorityChip(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () => _showPriorityMenu(context),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: cs.outline.withOpacity(0.5)),
        ),
        child: Icon(Icons.flag, size: 18, color: _priorityColor(_priority)),
      ),
    );
  }

  Future<void> _showPriorityMenu(BuildContext context) async {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final target = box.localToGlobal(Offset.zero, ancestor: overlay) & box.size;

    final selected = await showMenu<DsPriority>(
      context: context,
      position: RelativeRect.fromRect(target, Offset.zero & overlay.size),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      items: [
        _buildPriorityItem(
          DsPriority.high,
          'High Priority',
          Icons.flag,
          Colors.red,
        ),
        _buildPriorityItem(
          DsPriority.medium,
          'Medium Priority',
          Icons.flag,
          Colors.orange,
        ),
        _buildPriorityItem(
          DsPriority.low,
          'Low Priority',
          Icons.flag,
          Colors.green,
        ),
        const PopupMenuDivider(height: 8),
        _buildPriorityItem(
          DsPriority.none,
          'No Priority',
          Icons.flag_outlined,
          Colors.grey,
        ),
      ],
    );

    if (selected != null) {
      setState(() => _priority = selected);
      widget.onPriorityChanged?.call(selected);
    }
  }

  PopupMenuItem<DsPriority> _buildPriorityItem(
    DsPriority value,
    String label,
    IconData icon,
    Color color,
  ) {
    return PopupMenuItem<DsPriority>(
      value: value,
      child: Row(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 12),
          Text(label),
        ],
      ),
    );
  }

  void _handleSend() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    widget.onSend?.call(text, _date, _priority);
    setState(() {
      _controller.clear();
    });
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final d = DateTime(date.year, date.month, date.day);
    if (d == today) return 'Today';
    if (d == today.add(const Duration(days: 1))) return 'Tomorrow';
    if (d == today.subtract(const Duration(days: 1))) return 'Yesterday';
    return '${date.month}/${date.day}/${date.year}';
  }

  Color _priorityColor(DsPriority p) {
    switch (p) {
      case DsPriority.high:
        return Colors.red;
      case DsPriority.medium:
        return Colors.orange;
      case DsPriority.low:
        return Colors.green;
      case DsPriority.none:
        return Theme.of(context).colorScheme.onSurface.withOpacity(0.6);
    }
  }
}
