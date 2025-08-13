import 'package:flutter/material.dart';
import 'dropdown.dart';

class DsTaskInputDropdown extends StatefulWidget {
  const DsTaskInputDropdown({
    super.key,
    required this.taskOptions,
    this.selectedTask,
    this.onTaskSelected,
    this.onNewTaskRequested,
    this.onDateChanged,
    this.onPriorityChanged,
    this.selectedDate,
    this.selectedPriority,
  });

  final List<String> taskOptions;
  final String? selectedTask;
  final ValueChanged<String?>? onTaskSelected;
  final VoidCallback? onNewTaskRequested;
  final ValueChanged<DateTime?>? onDateChanged;
  final ValueChanged<String?>? onPriorityChanged;
  final DateTime? selectedDate;
  final String? selectedPriority;

  @override
  State<DsTaskInputDropdown> createState() => _DsTaskInputDropdownState();
}

class _DsTaskInputDropdownState extends State<DsTaskInputDropdown> {
  String? _selectedTask;
  DateTime? _selectedDate;
  String? _selectedPriority;
  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    _selectedTask = widget.selectedTask;
    _selectedDate = widget.selectedDate;
    _selectedPriority = widget.selectedPriority;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F6F2),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 7,
            offset: const Offset(0, -7),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header text
          Text(
            'Add your task',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 16),

          // Action buttons row
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    // Date button
                    _buildDateButton(context),
                    const SizedBox(width: 12),
                    // Priority button
                    _buildPriorityButton(context),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Microphone button for new task
              _buildMicrophoneButton(context),
            ],
          ),
          const SizedBox(height: 16),

          // Task dropdown
          _buildTaskDropdown(context),
        ],
      ),
    );
  }

  Widget _buildDateButton(BuildContext context) {
    final hasDate = _selectedDate != null;

    return GestureDetector(
      onTap: () => _showDatePicker(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.calendar_today, size: 20, color: Colors.grey.shade700),
            const SizedBox(width: 8),
            Text(
              hasDate ? _formatDate(_selectedDate!) : 'Today',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
            ),
            if (hasDate) ...[
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => _clearDate(),
                child: Icon(Icons.close, size: 16, color: Colors.grey.shade600),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPriorityButton(BuildContext context) {
    final hasPriority = _selectedPriority != null;

    return GestureDetector(
      onTap: () => _showPriorityPicker(context),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: hasPriority
              ? _getPriorityColor(_selectedPriority!)
              : Colors.white,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: hasPriority
                ? _getPriorityColor(_selectedPriority!).withOpacity(0.3)
                : Colors.grey.shade300,
          ),
        ),
        child: Icon(
          Icons.flag,
          size: 20,
          color: hasPriority ? Colors.white : Colors.grey.shade700,
        ),
      ),
    );
  }

  Widget _buildMicrophoneButton(BuildContext context) {
    return GestureDetector(
      onTap: widget.onNewTaskRequested,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Icon(Icons.mic, size: 20, color: Colors.grey.shade700),
      ),
    );
  }

  Widget _buildTaskDropdown(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Custom dropdown trigger
        GestureDetector(
          onTap: () => setState(() => _isDropdownOpen = !_isDropdownOpen),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedTask ?? 'Choose from existing tasks or create new',
                    style: TextStyle(
                      color: _selectedTask != null
                          ? Colors.grey.shade800
                          : Colors.grey.shade500,
                    ),
                  ),
                ),
                Icon(
                  _isDropdownOpen
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.grey.shade600,
                ),
              ],
            ),
          ),
        ),

        // Dropdown menu
        if (_isDropdownOpen) ...[
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                ...widget.taskOptions.map((task) => _buildDropdownItem(task)),
                if (widget.taskOptions.isNotEmpty) ...[
                  Divider(height: 1, color: Colors.grey.shade200),
                  _buildDropdownItem('Create new task...', isNewTask: true),
                ],
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildDropdownItem(String task, {bool isNewTask = false}) {
    return GestureDetector(
      onTap: () {
        if (isNewTask) {
          widget.onNewTaskRequested?.call();
        } else {
          setState(() {
            _selectedTask = task;
            _isDropdownOpen = false;
          });
          widget.onTaskSelected?.call(task);
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: _selectedTask == task
              ? Colors.grey.shade100
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            if (isNewTask) ...[
              Icon(Icons.add, size: 16, color: Colors.blue.shade600),
              const SizedBox(width: 8),
            ],
            Expanded(
              child: Text(
                task,
                style: TextStyle(
                  color: isNewTask
                      ? Colors.blue.shade600
                      : Colors.grey.shade800,
                  fontWeight: isNewTask ? FontWeight.w500 : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDatePicker(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
      widget.onDateChanged?.call(date);
    }
  }

  void _showPriorityPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => _buildPriorityBottomSheet(context),
    );
  }

  Widget _buildPriorityBottomSheet(BuildContext context) {
    final priorities = [
      {'label': 'High Priority', 'value': 'high', 'color': Colors.red},
      {'label': 'Medium Priority', 'value': 'medium', 'color': Colors.orange},
      {'label': 'Low Priority', 'value': 'low', 'color': Colors.green},
    ];

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Select Priority',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          ...priorities.map(
            (priority) => ListTile(
              leading: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: priority['color'] as Color,
                  shape: BoxShape.circle,
                ),
              ),
              title: Text(priority['label'] as String),
              onTap: () {
                setState(() {
                  _selectedPriority = priority['value'] as String;
                });
                widget.onPriorityChanged?.call(priority['value'] as String);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _clearDate() {
    setState(() {
      _selectedDate = null;
    });
    widget.onDateChanged?.call(null);
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final targetDate = DateTime(date.year, date.month, date.day);

    if (targetDate == today) return 'Today';
    if (targetDate == today.add(const Duration(days: 1))) return 'Tomorrow';
    if (targetDate == today.subtract(const Duration(days: 1)))
      return 'Yesterday';

    return '${date.month}/${date.day}/${date.year}';
  }

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      case 'low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
