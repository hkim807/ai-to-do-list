// pubspec.yaml
// dependencies: go_router: ^14.0.0  (or latest)

// lib/app/app.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import '../features/start_screen.dart';
import '../features/auth/sign_up_screen.dart';
import '../features/auth/NameEntryScreen.dart';
import '../features/survey/survey_intro_page.dart';
import '../features/survey/survey_question_screen.dart';
import '../features/survey/survey_done_page.dart';
import '../features/home/home_shell.dart';
import '../design_system/theme/app_theme.dart';
import '../features/survey/survey_controller.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: Builder(
        builder: (context) {
          final appState = context.watch<AppState>();
          final surveyController = SurveyController();
          final router = GoRouter(
            debugLogDiagnostics: true,
            initialLocation: '/start',
            refreshListenable:
                appState, // re‑evaluate redirects on state change
            redirect: (ctx, state) {
              final signedIn = appState.auth == AuthStatus.signedIn;
              final onboarding = appState.onboarding;

              // Allow assets like /start, /signup without loops
              final loggingIn =
                  state.matchedLocation.startsWith('/start') ||
                  state.matchedLocation.startsWith('/signup');

              if (!signedIn && !loggingIn) return '/start';
              if (signedIn &&
                  onboarding == OnboardingStatus.inProgress &&
                  !state.matchedLocation.startsWith('/survey')) {
                return '/survey/intro';
              }
              if (signedIn &&
                  onboarding == OnboardingStatus.notStarted &&
                  !state.matchedLocation.startsWith('/survey')) {
                return '/survey/intro';
              }
              if (signedIn &&
                  onboarding == OnboardingStatus.complete &&
                  (state.matchedLocation.startsWith('/start') ||
                      state.matchedLocation.startsWith('/signup') ||
                      state.matchedLocation.startsWith('/survey'))) {
                return '/home';
              }
              return null;
            },
            routes: [
              GoRoute(path: '/start', builder: (_, __) => const StartScreen()),
              GoRoute(
                path: '/signup',
                builder: (_, __) => const SignUpScreen(),
              ),
              GoRoute(
                path: '/enter-name',
                builder: (_, __) => const NameEntryScreen(),
              ),
              GoRoute(
                path: '/survey/intro',
                builder: (_, __) => const SurveyIntroScreen(),
              ),
              GoRoute(
                path: '/survey/q/:index',
                builder: (_, s) {
                  final i = int.tryParse(s.pathParameters['index'] ?? '0') ?? 0;
                  return SurveyQuestionScreen(
                    controller: surveyController,
                    index: i,
                  );
                },
              ),
              GoRoute(
                path: '/survey/done',
                builder: (_, __) => const SurveyDoneScreen(),
              ),
              GoRoute(
                path: '/home',
                builder: (_, __) => const HomeShell(), // tabs: List/Matrix
              ),
            ],
          );

          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'PrioritiQ',
            themeMode: ThemeMode.system,
            theme: buildLightTheme(),
            darkTheme: buildDarkTheme(),
            routerConfig: router,
          );
        },
      ),
    );
  }
}
