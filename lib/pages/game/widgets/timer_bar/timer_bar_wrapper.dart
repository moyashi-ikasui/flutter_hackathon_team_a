import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hackathon_team_a/features/game.dart';
import 'package:flutter_hackathon_team_a/features/game_state.dart';
import 'package:flutter_hackathon_team_a/pages/game/widgets/timer_bar/animated_timer_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimerBarWrapper extends ConsumerStatefulWidget {
  const TimerBarWrapper({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TimerBarWrapperState();
}

class _TimerBarWrapperState extends ConsumerState<TimerBarWrapper>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref
          .read(gameProvider.notifier)
          .initializeAnimationController(this, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '怒りパラメータ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: -3,
          ),
        ),
        const SizedBox(width: 10),
        Center(
          child: gameState.isAnimationControllerInitialized
              ? AnimatedTimerBar(
                  animationController: gameState.animationController!)
              : const Text('準備中...'),
        ),
      ],
    );
  }
}
