// features/survey/survey_done_page.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SurveyDoneScreen extends StatelessWidget {
  const SurveyDoneScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4ED),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                'assets/images/survey_end_image.png',
                height: 220,
              ), // Fixed asset path
              const SizedBox(height: 24),
              Text(
                'Survey Complete!',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Help us learn your style so we can create your perfect to‑do list.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => context.go('/home'),
                  child: const Text('Get Started'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
