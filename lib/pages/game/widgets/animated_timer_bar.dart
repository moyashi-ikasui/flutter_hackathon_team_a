// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/constants/const.dart';
import 'package:flutter_hackathon_team_a/util/size_helper.dart';

class AnimatedTimerBar extends StatelessWidget {
  const AnimatedTimerBar({
    required this.animationController,
    Key? key,
  }) : super(key: key);

  final AnimationController animationController;

  int get _remainingCallTimeSec =>
      (gameTimeSec * (1 - animationController.value)).toInt();
  Duration get _remainingTimeDuration =>
      Duration(seconds: _remainingCallTimeSec);
  int get _formatMinutes => _remainingTimeDuration.inMinutes;
  int get _formatSeconds => _remainingCallTimeSec % gameTimeSec;
  String get _formattedTime =>
      '$_formatMinutes:${_formatSeconds.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    final buttonWidthMax = context.width * 0.9;
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Padding(
          padding: EdgeInsets.symmetric(
              vertical: 18,
              horizontal: (buttonWidthMax * animationController.value) * 0.08),
          child: Container(
            width: buttonWidthMax * (1 - animationController.value),
            height: 16,
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(50),
            ),
            child: FittedBox(
              child: Center(
                child: Text(
                  _formattedTime,
                  style: const TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
