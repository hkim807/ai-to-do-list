// lib/app/app_state.dart
import 'package:flutter/foundation.dart';

enum AuthStatus { signedOut, signedIn }

enum OnboardingStatus { notStarted, inProgress, complete }

class AppState extends ChangeNotifier {
  AuthStatus auth = AuthStatus.signedOut;
  OnboardingStatus onboarding = OnboardingStatus.notStarted;

  void signIn() {
    auth = AuthStatus.signedIn;
    notifyListeners();
  }

  void signOut() {
    auth = AuthStatus.signedOut;
    onboarding = OnboardingStatus.notStarted;
    notifyListeners();
  }

  void startSurvey() {
    onboarding = OnboardingStatus.inProgress;
    notifyListeners();
  }

  void completeSurvey() {
    onboarding = OnboardingStatus.complete;
    notifyListeners();
  }
}
