import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:no_api_shopping_app/counter.dart';
import 'package:o3d/o3d.dart';

class Items extends StatelessWidget {
  final String src;
  final O3DController controller;
  final double height;
  final double width;
  final BorderRadius borderRadius;
  final double blur;
  final double borderWidth;
  final double elevation;
  final double frostedOpacity;
  final String name;
  final String weight;
  final String price;
  final ValueChanged<int> newChangedCounter;

  const Items({
    required this.src,
    required this.controller,
    required this.name,
    required this.weight,
    required this.price,
    required this.newChangedCounter,
    this.height = 300,
    this.width = 150,
    this.borderRadius = const BorderRadius.all(Radius.circular(20.0)),
    this.blur = 20.0,
    this.borderWidth = 1.0,
    this.elevation = 3.0,
    this.frostedOpacity = 0.2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      borderRadius: borderRadius,
      gradient: LinearGradient(
        colors: [Colors.white.withOpacity(0.4), Colors.white.withOpacity(0.1)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderGradient: LinearGradient(
        colors: [Colors.white.withOpacity(0.5), Colors.white.withOpacity(0.1)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      blur: blur,
      borderWidth: borderWidth,
      elevation: elevation,
      shadowColor: Colors.black.withOpacity(0.2),
      frostedOpacity: frostedOpacity,
      height: height,
      width: width,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                height: 100,
                width: 100,
                child: O3D(
                  controller: controller,
                  src: src,
                  ar: false,
                  autoPlay: true,
                  autoRotate: true,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Weight: $weight",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Price/Kg: $price",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
           CounterWidget(
            changedCounter: newChangedCounter,
          ),
        ],
      ),
    );
  }
}
