import 'package:flutter/material.dart';
import 'package:onboarding_example/widgets/build_page.dart';

Widget page1() {
  return buildPage(
    color: Colors.blueAccent,
    image: 'assets/images/image_placeholder.png',
    title: 'Headline',
    subtitle: 'Subline',
    page: 'Page 1',
  );
}
