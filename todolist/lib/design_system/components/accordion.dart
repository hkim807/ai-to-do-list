import 'package:flutter/material.dart';
import 'task_item.dart';
import 'package:todolist/design_system/tokens/spacing.dart';
import 'package:todolist/design_system/tokens/typography_tokens.dart';

class DsAccordionSection extends StatefulWidget {
  const DsAccordionSection({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.initiallyExpanded = true,
    required this.children,
    this.onAddPressed,
  });

  final String title;
  final String? subtitle;
  final Widget? leading;
  final bool initiallyExpanded;
  final List<Widget> children;
  final VoidCallback? onAddPressed;

  @override
  State<DsAccordionSection> createState() => _DsAccordionSectionState();
}

class _DsAccordionSectionState extends State<DsAccordionSection>
    with SingleTickerProviderStateMixin {
  late bool _expanded;
  late AnimationController _controller;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _expanded = widget.initiallyExpanded;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: _expanded ? 1 : 0,
    );
    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _expanded = !_expanded;
      if (_expanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        // borderRadius: BorderRadius.circular(12),
        // border: Border.all(color: cs.outline.withOpacity(0.5)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          InkWell(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            onTap: _toggle,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                children: [
                  if (widget.leading != null) ...[
                    SizedBox(width: 4),
                    widget.leading!,
                    const SizedBox(width: 8),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TypographyTokens.headingS(cs.onSurface),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (widget.subtitle != null) ...[
                          const SizedBox(height: 2),
                          Text(
                            widget.subtitle!,
                            style: TypographyTokens.subtitle(cs.onSurface),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Add button (does not toggle)
                  Material(
                    color: cs.surfaceVariant,
                    shape: const StadiumBorder(),
                    child: InkWell(
                      customBorder: const StadiumBorder(),
                      onTap: widget.onAddPressed,
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.add, size: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    _expanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: cs.onSurface,
                  ),
                ],
              ),
            ),
          ),
          Divider(height: 1, color: cs.outline.withOpacity(0.2)),
          // Body
          ClipRect(
            child: SizeTransition(
              sizeFactor: _expandAnimation,
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
                  child: Column(
                    children: [
                      for (int i = 0; i < widget.children.length; i++) ...[
                        widget.children[i],
                        if (i != widget.children.length - 1)
                          const SizedBox(height: 8),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Helper builder to quickly create task items
Widget dsTask({
  required String title,
  String? subtitle,
  bool completed = false,
  ValueChanged<bool?>? onChanged,
}) {
  return DsTaskItem(
    label: title,
    selected: completed,
    onChanged: onChanged,
    color: DsChipColor.brand,
  );
}
