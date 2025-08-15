import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../design_system/components/task_composer.dart';
import '../tasks/list_page.dart';
import '../tasks/matrix_page.dart';
import '../tasks/task_store.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  final _page = PageController();
  int _index = 0;

  @override
  void dispose() {
    _page.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  _TopTab(
                    label: 'List',
                    selected: _index == 0,
                    onTap: () => _animateTo(0),
                  ),
                  const SizedBox(width: 16),
                  _TopTab(
                    label: 'Matrix',
                    selected: _index == 1,
                    onTap: () => _animateTo(1),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Pages
            Expanded(
              child: PageView(
                controller: _page,
                onPageChanged: (i) => setState(() => _index = i),
                children: const [
                  ListPage(),
                  MatrixPage(),
                ],
              ),
            ),

            // Composer docked at the bottom
            _BottomComposer(),
          ],
        ),
      ),
    );
  }

  void _animateTo(int i) {
    setState(() => _index = i);
    _page.animateToPage(
      i,
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOut,
    );
  }
}

class _TopTab extends StatelessWidget {
  const _TopTab({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme.titleLarge!;
    final cs = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 160),
        style: text.copyWith(
          color: selected ? cs.onBackground : cs.onBackground.withOpacity(.5),
          fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
        ),
        child: Text(label),
      ),
    );
  }
}

class _BottomComposer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = context.read<TaskStore>();
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16 + MediaQuery.of(context).padding.bottom,
        top: 8,
      ),
      child: DsTaskComposer(
        onSend: (title, date, priority) {
          if (title.trim().isEmpty) return;
          store.addQuickTask(title.trim());
        },
      ),
    );
  }
}