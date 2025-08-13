import 'package:flutter/material.dart';
import '../design_system/components/button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  ThemeMode _mode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4ED),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Spacer(),
              // Logo and Image Section
              Column(
                children: [
                  // Logo
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 34,
                        height: 36,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Start Page Image
                  Image.asset(
                    'assets/images/startpage_image.png',
                    width: double.infinity,
                    height: 331,
                    fit: BoxFit.cover,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/startpage_image.png',
                      width: double.infinity,
                      height: 331,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 42),
              // Tagline
              const Text(
                'Jump into what matters.',
                style: TextStyle(
                  fontFamily: 'Gambarino',
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF000000),
                  letterSpacing: -0.48,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              // Authentication Buttons
              Column(
                children: [
                  // GitHub Button
                  DsButton(
                    label: 'Continue with Github',
                    onPressed: () {
                      // TODO: Implement GitHub authentication
                    },
                    variant: DsButtonVariant.neutral,
                    iconLeft: const Icon(Icons.code, size: 20),
                  ),
                  const SizedBox(height: 16),
                  // Google Button
                  DsButton(
                    label: 'Continue with Google',
                    onPressed: () {
                      // TODO: Implement Google authentication
                    },
                    variant: DsButtonVariant.neutral,
                    iconLeft: const Icon(Icons.search, size: 20),
                  ),
                  const SizedBox(height: 16),
                  // Email Button
                  DsButton(
                    label: 'Continue with Email',
                    onPressed: () {
                      // TODO: Navigate to email signup
                    },
                    variant: DsButtonVariant.neutral,
                    iconLeft: const Icon(Icons.email, size: 20),
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
            ],
          ),
        ),
      ),
    );
  }
}
