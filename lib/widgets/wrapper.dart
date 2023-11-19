import 'package:flutter/material.dart';
import 'package:onboarding_example/screens/home_screen.dart';
import 'package:onboarding_example/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingWrapper extends StatefulWidget {
  const OnboardingWrapper({super.key});

  @override
  _OnboardingWrapperState createState() => _OnboardingWrapperState();
}

class _OnboardingWrapperState extends State<OnboardingWrapper> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkOnboardingStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _buildOnboardingWidget(snapshot.data ?? false);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Future<bool> _checkOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding_complete') ?? false;
  }

  Widget _buildOnboardingWidget(bool onboardingComplete) {
    return onboardingComplete ? const HomeScreen() : const OnboardingScreen();
  }
}
