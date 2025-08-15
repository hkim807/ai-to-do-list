import 'package:flutter/material.dart';
import '../../design_system/components/input_field.dart';
import '../../design_system/components/primary_button.dart';
import 'package:go_router/go_router.dart';
import '../../design_system/tokens/typography_tokens.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  String? _emailError;
  String? _passwordError;
  String? _confirmError;

  bool _submitting = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmCtrl.dispose();
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
                onPressed: () => Navigator.maybePop(context),
              ),
              // App bar minimal
              const SizedBox(height: 24),
              Text(
                'Create account',
                style: TypographyTokens.headingL(cs.onSurface),
              ),
              const SizedBox(height: 16),
              Text(
                'Add your email and password',
                style: TypographyTokens.bodyL(cs.onSurfaceVariant),
              ),
              const SizedBox(height: 24),

              // Fields
              DsTextField(
                label: 'Email',
                placeholder: 'you@example.com',
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                errorText: _emailError,
              ),
              const SizedBox(height: 16),
              DsTextField(
                label: 'Password',
                placeholder: 'Enter a strong password',
                controller: _passwordCtrl,
                errorText: _passwordError,
                obscureText: true,
              ),
              const SizedBox(height: 16),
              DsTextField(
                label: 'Confirm password',
                placeholder: 'Re-enter your password',
                controller: _confirmCtrl,
                errorText: _confirmError,
                obscureText: true,
              ),

              // const Spacer(),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: DsPrimaryButton(
                  label: _submitting ? 'Creating...' : 'Sign up',
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
      _emailError = null;
      _passwordError = null;
      _confirmError = null;
    });

    final email = _emailCtrl.text.trim();
    final password = _passwordCtrl.text;
    final confirm = _confirmCtrl.text;

    // Simple validation mimicking the Figma error state
    if (!_isValidEmail(email)) {
      setState(() => _emailError = 'Please enter a valid email address');
      return;
    }
    if (password.length < 8) {
      setState(() => _passwordError = 'Password must be at least 8 characters');
      return;
    }
    if (confirm != password) {
      setState(() => _confirmError = 'Passwords do not match');
      return;
    }

    setState(() => _submitting = true);
    await Future.delayed(const Duration(milliseconds: 800));
    setState(() => _submitting = false);

    // Navigate to survey onboarding instead of just showing snackbar
    if (mounted) {
      // Go to survey intro to start onboarding
      context.go('/enter-name');
    }
  }

  bool _isValidEmail(String email) {
    final r = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    return r.hasMatch(email);
  }
}
