// Flutter imports:
import 'package:flutter/material.dart';

class HSpacer extends StatelessWidget {
  const HSpacer({
    required this.height,
    Key? key,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class WSpacer extends StatelessWidget {
  const WSpacer({
    required this.width,
    Key? key,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
