// lib/features/survey/survey_question_screen.dart
import 'package:flutter/material.dart';
import '../../design_system/components/button.dart';
import 'package:go_router/go_router.dart';
import '../../design_system/components/choice_chip.dart';
import '../../design_system/components/progress_bar.dart';
import '../../design_system/components/primary_button.dart';
import 'survey_controller.dart';
import 'models.dart' show SurveyQuestion, SurveyArgs;

// If you use go_router, you can create with: SurveyQuestionScreen.fromArgs(state.extra as SurveyArgs)
// Use shared models from models.dart

class SurveyQuestionScreen extends StatefulWidget {
  const SurveyQuestionScreen({
    super.key,
    required this.controller,
    required this.index,
  });

  final SurveyController controller;
  final int index;

  // Nice helper for go_router:
  static SurveyQuestionScreen fromArgs(SurveyArgs a) => SurveyQuestionScreen(
    controller: a.controller as SurveyController,
    index: a.index,
  );

  @override
  State<SurveyQuestionScreen> createState() => _SurveyQuestionScreenState();
}

class _SurveyQuestionScreenState extends State<SurveyQuestionScreen> {
  int? _singleSelected; // single‑choice index (null = nothing picked)
  late final SurveyQuestion q;
  late final int total;

  @override
  void initState() {
    super.initState();
    q = widget.controller.questions[widget.index] as SurveyQuestion;
    total = widget.controller.questions.length;

    // Rehydrate if user navigates back and forth
    final existing = widget.controller.answers[q.id];
    if (existing is String) {
      _singleSelected = q.options.indexOf(existing);
      if (_singleSelected == -1) _singleSelected = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final progress = (widget.index + 1) / total;
    final canContinue =
        _singleSelected != null || q.multi; // expand for multi later

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
                  Expanded(child: DsProgressBar(value: progress)),
                ],
              ),
              const SizedBox(height: 32),

              // Title
              Text(
                q.title,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: cs.onBackground,
                ),
              ),

              const SizedBox(height: 24),

              // Options
              Expanded(
                child: ListView.separated(
                  itemCount: q.options.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final label = q.options[index];
                    final selected = _singleSelected == index;
                    return DsChoiceChip(
                      label: label,
                      selected: selected,
                      onChanged: (v) => setState(() {
                        // single‑choice behaviour
                        _singleSelected = v ? index : null;
                      }),
                      color: _chipColour(selected, cs),
                    );
                  },
                ),
              ),

              // Continue button
              DsPrimaryButton(
                label: (widget.index == total - 1) ? 'Finish' : 'Continue',
                onPressed: canContinue ? _handleContinue : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  DsChipColor _chipColour(bool selected, ColorScheme cs) {
    // Simple rule: selected => brand, otherwise neutral.
    return selected ? DsChipColor.brand : DsChipColor.neutral;
  }

  void _handleContinue() {
    // Persist the answer
    if (_singleSelected != null) {
      widget.controller.answers[q.id] = q.options[_singleSelected!];
    }

    // Navigate
    final next = widget.index + 1;
    if (next < widget.controller.questions.length) {
      // go_router:
      context.push(
        '/survey/q/$next',
        extra: SurveyArgs(controller: widget.controller, index: next),
      );
    } else {
      // go_router:
      context.go('/survey/done');
    }
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
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Icon(Icons.arrow_back, size: 20),
        ),
      ),
    );
  }
}
