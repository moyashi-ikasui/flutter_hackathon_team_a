import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hackathon_team_a/pages/game/feature/game.dart';
import 'package:flutter_hackathon_team_a/pages/game/feature/game_state.dart';
import 'package:flutter_hackathon_team_a/pages/game/widgets/animated_timer_bar.dart';
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
      ref.read(gameProvider.notifier).initializeAnimationController(this);
    });
  }

  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameProvider);
    return Center(
      child: gameState.isAnimationControllerInitialized
          ? AnimatedTimerBar(
              animationController: gameState.animationController!)
          : const Text('準備中...'),
    );
  }
}
