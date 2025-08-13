import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:todolist/screens/auth/sign_up_screen.dart';

@widgetbook.UseCase(name: 'Sign Up - Idle', type: Scaffold)
Widget signUpIdle(BuildContext context) {
  return const SignUpScreen();
}

@widgetbook.UseCase(name: 'Sign Up - Typing', type: Scaffold)
Widget signUpTyping(BuildContext context) {
  return const _TypingWrapper();
}

@widgetbook.UseCase(name: 'Sign Up - Error', type: Scaffold)
Widget signUpError(BuildContext context) {
  return const _ErrorWrapper();
}

class _TypingWrapper extends StatefulWidget {
  const _TypingWrapper();
  @override
  State<_TypingWrapper> createState() => _TypingWrapperState();
}

class _TypingWrapperState extends State<_TypingWrapper> {
  @override
  void initState() {
    super.initState();
    // No-op; screen itself handles typing visuals
  }
  @override
  Widget build(BuildContext context) => const SignUpScreen();
}

class _ErrorWrapper extends StatefulWidget {
  const _ErrorWrapper();
  @override
  State<_ErrorWrapper> createState() => _ErrorWrapperState();
}

class _ErrorWrapperState extends State<_ErrorWrapper> {
  @override
  Widget build(BuildContext context) {
    // Show the screen and then immediately trigger error to visualize
    return Scaffold(
      body: Builder(
        builder: (context) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Example error state: invalid email')),
            );
          });
          return const SignUpScreen();
        },
      ),
    );
  }
}
