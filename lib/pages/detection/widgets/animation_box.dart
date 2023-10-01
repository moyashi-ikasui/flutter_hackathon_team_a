import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_hackathon_team_a/pages/detection/widgets/light_spot.dart';

class AnimationBox extends StatefulWidget {
  const AnimationBox({super.key});

  @override
  State<AnimationBox> createState() => _AnimationBoxState();
}

class _AnimationBoxState extends State<AnimationBox> {
  List<DotPosition> dotPositions = [];
  bool showHorizantalLine = false;
  bool moveHorizantalLine = false;
  bool showVerticalLine = false;
  bool moveVerticalLine = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        showHorizantalLine = true;
      });
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        moveHorizantalLine = true;
      });
      await Future.delayed(const Duration(milliseconds: 600));
      setState(() {
        showHorizantalLine = false;
        showVerticalLine = true;
      });
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        moveVerticalLine = true;
      });
      await Future.delayed(const Duration(milliseconds: 600));
      setState(() {
        showVerticalLine = false;
      });
      for (var i = 0; i < 5; i++) {
        final randomValueX = math.Random().nextInt(150).toDouble() + 10;
        final randomValueY = math.Random().nextInt(150).toDouble() + 10;
        final dotPosition = DotPosition(x: randomValueX, y: randomValueY);
        setState(() {
          dotPositions.add(dotPosition);
        });
        await Future.delayed(const Duration(milliseconds: 500));
      }
    });
  }

  static const double imageSize = 200;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imageSize,
      height: imageSize,
      child: Stack(
        children: [
          // X軸線
          if (showHorizantalLine)
            SizedBox(
              width: imageSize,
              height: imageSize,
              child: AnimatedAlign(
                key: const ValueKey('horizantal'),
                curve: Curves.easeOut,
                alignment: moveHorizantalLine
                    ? Alignment.topCenter
                    : Alignment.bottomCenter,
                duration: const Duration(milliseconds: 500),
                child: Container(
                  width: imageSize,
                  height: 2,
                  color: Colors.red,
                ),
              ),
            ),
          if (showVerticalLine)
            SizedBox(
              width: imageSize,
              height: imageSize,
              child: AnimatedAlign(
                key: const ValueKey('vertical'),
                curve: Curves.easeOut,
                alignment: moveVerticalLine
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                duration: const Duration(milliseconds: 500),
                child: Container(
                  height: imageSize,
                  width: 2,
                  color: Colors.red,
                ),
              ),
            ),
          if (dotPositions.isNotEmpty)
            Positioned(
              left: dotPositions[0].x,
              top: dotPositions[0].y,
              child: const LightSpot(),
            ),
          if (dotPositions.length >= 2)
            Positioned(
              left: dotPositions[1].x,
              top: dotPositions[1].y,
              child: const LightSpot(),
            ),
          if (dotPositions.length >= 3)
            Positioned(
              left: dotPositions[2].x,
              top: dotPositions[2].y,
              child: const LightSpot(),
            ),
          if (dotPositions.length >= 4)
            Positioned(
              left: dotPositions[3].x,
              top: dotPositions[3].y,
              child: const LightSpot(),
            ),
          if (dotPositions.length >= 5)
            Positioned(
              left: dotPositions[4].x,
              top: dotPositions[4].y,
              child: const LightSpot(),
            ),
        ],
      ),
    );
  }
}

class DotPosition {
  DotPosition({
    required this.x,
    required this.y,
  });

  final double x;
  final double y;
}
