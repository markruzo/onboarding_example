import 'package:flutter/material.dart';
import 'package:onboarding_example/pages/page1.dart';
import 'package:onboarding_example/pages/page2.dart';
import 'package:onboarding_example/pages/page3.dart';
import 'package:onboarding_example/screens/home_screen.dart';
import 'package:onboarding_example/widgets/button_primary.dart';
import 'package:onboarding_example/widgets/button_skip.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late SharedPreferences prefs;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    initializePreferences();
    super.initState();
  }

  void initializePreferences() async {
    prefs = await SharedPreferences.getInstance();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkOnboardingStatus();
    });
  }

  void checkOnboardingStatus() {
    final isOnBoardingComplete = prefs.getBool('onboarding_complete') ?? false;

    if (isOnBoardingComplete && mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 2);
            },
            children: [
              page1(),
              page2(),
              page3(),
            ],
          ),
          SkipButton(
            controller: controller,
          ),
          ButtonPrimary(
            isLastPage: isLastPage,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
