import 'package:flutter/animation.dart';
import 'package:flutter_hackathon_team_a/constants/const.dart';
import 'package:flutter_hackathon_team_a/pages/game/feature/timer_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Timer extends AutoDisposeNotifier<TimerState> {
  Timer();

  void initializeController(TickerProvider tickerProvider) {
    state = state.copyWith(
      animationController: AnimationController(
        vsync: tickerProvider,
        duration: const Duration(seconds: gameTimeSec),
      ),
    );
    startTimer();
  }

  void startTimer() {
    state.animationController!.forward();
    state.animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // タイムアップ後の処理を追加
      }
    });
  }

  void stopTimer() {
    state.animationController!.stop();
  }

  void reduceTimer() {
    final newValue =
        state.animationController!.value + (timeReduceSec / gameTimeSec);
    final isNewValueNegative = newValue > 1;
    final fixedNewValue = isNewValueNegative ? 1.0 : newValue;
    state.animationController!.forward(from: fixedNewValue);
  }

  @override
  TimerState build() {
    return const TimerState();
  }
}

final timerProvider =
    NotifierProvider.autoDispose<Timer, TimerState>(Timer.new);
