// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/constants/const.dart';
import 'package:flutter_hackathon_team_a/pages/game/widgets/timer_bar/timer_bar_base.dart';
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
    final buttonWidthMax = context.width * 0.8 - 200;
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        const TimerBarBase(),
        AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Container(
              width: buttonWidthMax * (1 - animationController.value),
              height: 20,
              decoration: BoxDecoration(
                color: Colors.grey,
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
            );
          },
        ),
      ],
    );
  }
}
