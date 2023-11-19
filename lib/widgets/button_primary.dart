import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onboarding_example/screens/complete_screen.dart';
import 'package:onboarding_example/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    super.key,
    required this.isLastPage,
    required this.controller,
  });

  final bool isLastPage;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 52.0,
      left: 0.0,
      right: 0.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 48, right: 48),
              child: GestureDetector(
                onTap: () async {
                  if (isLastPage) {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool('onboarding_complete', true);

                    BuildContext? currentContext = context;

                    Navigator.of(currentContext).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const CompleteScreen(),
                      ),
                    );

                    Timer(const Duration(seconds: 2), () {
                      if (currentContext.mounted) {
                        Navigator.of(currentContext).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      }
                    });
                  } else {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      isLastPage ? 'Get Started' : 'Next Page',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
