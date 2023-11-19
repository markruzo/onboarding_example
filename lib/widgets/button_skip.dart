import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0,
      right: 20.0,
      top: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () => controller.jumpToPage(2),
            child: Container(
              height: 28,
              width: 28,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/svg/x24/icon-x.svg',
                  height: 20,
                  width: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
