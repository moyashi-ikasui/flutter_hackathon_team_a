// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/util/size_helper.dart';

class TimerBarBase extends StatelessWidget {
  const TimerBarBase({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonWidthMax = context.width * 0.8;
    return Container(
      width: buttonWidthMax,
      height: 16,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
