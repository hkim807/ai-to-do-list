// features/home/home_shell.dart
import 'package:flutter/material.dart';
import '../../design_system/components/eisenhower_matrix.dart';
import '../../design_system/components/task_composer.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});
  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell>
    with SingleTickerProviderStateMixin {
  late final TabController _tab = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4ED),
      appBar: AppBar(
        title: const Text('PrioritiQ'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tab,
          tabs: const [
            Tab(text: 'List'),
            Tab(text: 'Matrix'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tab,
        children: const [
          DsEisenhowerMatrix(tasks: []),
          DsTaskComposer(),
        ],
      ),
      bottomNavigationBar: _ComposerBar(
        onSubmit: (text) {
          // TODO: create task with AI scoring → place in list & matrix
        },
      ),
    );
  }
}

class _ComposerBar extends StatelessWidget {
  const _ComposerBar({required this.onSubmit});
  final ValueChanged<String> onSubmit;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(hintText: 'Add your task'),
              ),
            ),
            const SizedBox(width: 8),
            FilledButton(
              onPressed: () {
                if (controller.text.trim().isNotEmpty)
                  onSubmit(controller.text.trim());
                controller.clear();
              },
              child: const Icon(Icons.arrow_upward),
            ),
          ],
        ),
      ),
    );
  }
}
