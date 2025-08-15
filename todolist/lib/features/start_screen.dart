import 'package:flutter/material.dart';
import '../design_system/components/button.dart';
import 'package:go_router/go_router.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  ThemeMode _mode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4ED),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Logo and Brand Section
              Column(
                children: [
                  // Logo
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Gradient Logo Placeholder (using a Container with gradient)
                      Image.asset(
                        'assets/images/prioritylogo.png',
                        width: 34,
                        height: 36,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              // Continue Button
              SizedBox(
                width: double.infinity,
                child: DsButton(
                  label: 'Continue',
                  onPressed: () {
                    context.go('/signup');
                  },
                  variant: DsButtonVariant.neutral,
                ),
              ),
              const SizedBox(height: 16),
              // Theme Toggle Button
              TextButton(
                onPressed: () {
                  setState(() {
                    _mode = _mode == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
                  });
                },
                child: Text(
                  'Toggle Theme (${_mode == ThemeMode.light
                      ? 'Light'
                      : _mode == ThemeMode.dark
                      ? 'Dark'
                      : 'System'})',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
