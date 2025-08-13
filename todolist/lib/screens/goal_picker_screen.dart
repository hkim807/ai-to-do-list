import 'package:flutter/material.dart';
import '../design_system/components/button.dart';
import '../design_system/components/choice_chip.dart';
import '../design_system/components/progress_bar.dart';
import '../design_system/components/primary_button.dart';

class GoalPickerScreen extends StatefulWidget {
  const GoalPickerScreen({super.key});

  @override
  State<GoalPickerScreen> createState() => _GoalPickerScreenState();
}

class _GoalPickerScreenState extends State<GoalPickerScreen> {
  final List<_Option> _options = <_Option>[
    const _Option('Career/Study'),
    const _Option('Health & Fitness'),
    const _Option('Relationships'),
    const _Option('Personal Growth', preselected: true),
    const _Option('Other (write in)'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      backgroundColor: cs.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
          child: Column(
            children: [
              // Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _SubtleIconButton(
                    icon: Icons.arrow_back,
                    onPressed: () => Navigator.maybePop(context),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(child: DsProgressBar(value: 0.25)),
                ],
              ),
              const SizedBox(height: 32),

              // Title
              Text(
                'Which area matters most to you right now?',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(color: cs.onBackground),
              ),

              const SizedBox(height: 24),

              // Options
              Expanded(
                child: ListView.separated(
                  itemCount: _options.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final opt = _options[index];
                    return DsChoiceChip(
                      label: opt.label,
                      selected: opt.selected,
                      onChanged: (v) => setState(() => _options[index] = opt.copyWith(selected: v)),
                      color: vColorFor(index, cs),
                    );
                  },
                ),
              ),

              // Continue button
              DsPrimaryButton(
                label: 'Continue',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  DsChipColor vColorFor(int index, ColorScheme cs) {
    // Example palette cycling: first/last selected brand, others neutral
    if (_options[index].selected) return DsChipColor.brand;
    return DsChipColor.neutral;
  }
}


class _SubtleIconButton extends StatelessWidget {
  const _SubtleIconButton({required this.icon, this.onPressed});
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Material(
      color: cs.surfaceVariant,
      shape: const StadiumBorder(),
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(icon, color: cs.onSurface, size: 20),
        ),
      ),
    );
  }
}

class _Option {
  const _Option(this.label, {this.preselected = false})
      : selected = preselected;
  final String label;
  final bool preselected;
  final bool selected;
  _Option copyWith({bool? selected}) => _Option(label, preselected: selected ?? this.selected);
}


