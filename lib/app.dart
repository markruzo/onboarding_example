import 'package:flutter/material.dart';
import 'package:onboarding_example/widgets/wrapper.dart';

class App extends StatelessWidget {
  static const String appTitle = 'Onboarding Example';

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        fontFamily: 'DM Sans',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const OnboardingWrapper(),
    );
  }
}
