import 'package:flutter/material.dart';
import '../../design_system/components/input_field.dart';
import '../../design_system/components/primary_button.dart';
import 'package:go_router/go_router.dart';
import '../../design_system/tokens/typography_tokens.dart';

class NameEntryScreen extends StatefulWidget {
  const NameEntryScreen({super.key});

  @override
  State<NameEntryScreen> createState() => _NameEntryScreenState();
}

class _NameEntryScreenState extends State<NameEntryScreen> {
  final _nameCtrl = TextEditingController();

  String? _nameError;

  bool _submitting = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  context.go('/signup');
                },
              ),
              // App bar minimal
              const SizedBox(height: 24),
              Text(
                'Welcome to Todolist',
                style: TypographyTokens.headingL(cs.onSurface),
              ),
              const SizedBox(height: 16),
              Text(
                'Your personalised plan is ready.\nBefore we get started, let’s get to know each other.',
                style: TypographyTokens.bodyL(cs.onSurfaceVariant),
              ),
              const SizedBox(height: 24),

              // Fields
              DsTextField(
                label: 'Name',
                placeholder: 'Enter your name',
                controller: _nameCtrl,
                keyboardType: TextInputType.text,
                errorText: _nameError,
              ),

              // const Spacer(),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: DsPrimaryButton(
                  label: _submitting ? 'Creating...' : 'Continue',
                  onPressed: _submitting ? null : _onSubmit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmit() async {
    setState(() {
      _nameError = null;
    });

    final name = _nameCtrl.text.trim();
    if (name.isEmpty) {
      setState(() => _nameError = 'Please enter your name');
      return;
    }

    setState(() => _submitting = true);
    await Future.delayed(const Duration(milliseconds: 800));
    setState(() => _submitting = false);

    // Navigate to survey onboarding instead of just showing snackbar
    if (mounted) {
      // Go to survey intro to start onboarding
      context.go('/survey/intro');
    }
  }
}
