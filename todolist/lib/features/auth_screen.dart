import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../design_system/components/button.dart';
import 'auth/sign_up_screen.dart';
import '../design_system/tokens/typography_tokens.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),

          child: LayoutBuilder(
            builder: (context, constraints) {
              final maxContentWidth = constraints.maxWidth.clamp(320.0, 560.0);
              final imageHeight = math.max(
                160.0,
                math.min(constraints.maxHeight * 0.30, 320.0),
              );

              return Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxContentWidth),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: 64),

                              // Logo
                              Image.asset(
                                'assets/images/prioritylogo.png',
                                width: 180,
                                height: 38,
                                fit: BoxFit.contain,
                              ),

                              const SizedBox(height: 60),

                              // Illustration
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: SizedBox(
                                  height: imageHeight,
                                  width: double.infinity,
                                  child: Image.asset(
                                    'assets/images/startpage_image.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 80),

                              // Tagline
                              Text(
                                'Jump into what matters.',
                                textAlign: TextAlign.center,
                                style: TypographyTokens.headingM(cs.onSurface),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Bottom buttons
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: _AuthButtons(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _AuthButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: DsButton(
            label: 'Continue with Github',
            onPressed: () {},
            variant: DsButtonVariant.neutral,
            iconLeft: const Icon(Icons.code, size: 20),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: DsButton(
            label: 'Continue with Google',
            onPressed: () {},
            variant: DsButtonVariant.neutral,
            iconLeft: const Icon(Icons.search, size: 20),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: DsButton(
            label: 'Continue with Email',
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const SignUpScreen()));
            },
            variant: DsButtonVariant.neutral,
            iconLeft: const Icon(Icons.email_outlined, size: 20),
          ),
        ),
      ],
    );
  }
}
