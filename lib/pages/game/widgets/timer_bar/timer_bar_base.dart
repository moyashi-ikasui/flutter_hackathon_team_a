// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/features/game.dart';
import 'package:flutter_hackathon_team_a/util/size_helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimerBarBase extends HookConsumerWidget {
  const TimerBarBase({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gameProvider);
    final timeValue = state.animationController!.value;
    final buttonWidthMax = context.width * 0.8 - 200; // 「怒りパラメータ」文字width分引く
    return Container(
      width: buttonWidthMax,
      height: 20,
      decoration:
          BoxDecoration(color: timeValue > 0.5 ? Colors.red : Colors.yellow),
    );
  }
}
