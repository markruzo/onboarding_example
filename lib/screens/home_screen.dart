import 'package:flutter/material.dart';
import 'package:onboarding_example/widgets/top_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TopNavigation(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    Text('ListView Content'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
