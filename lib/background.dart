import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          child: Image.asset(
            'assets/background.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: GlassContainer.clearGlass(
            color: Colors.grey.withOpacity(0.1),
            blur: 20,
            borderRadius: BorderRadius.zero,
            borderColor: Colors.transparent,
          ),
        ),
        Positioned.fill(child: child),
      ],
    );
  }
}
