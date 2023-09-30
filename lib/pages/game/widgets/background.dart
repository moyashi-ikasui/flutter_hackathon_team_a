import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key, this.widget});

  final widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          margin: const EdgeInsets.symmetric(vertical: 34.5, horizontal: 63),
          child: widget,
        ),
      ),
    );
  }
}
