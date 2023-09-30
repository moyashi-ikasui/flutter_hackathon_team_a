import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/constants/const.dart';
import 'package:flutter_hackathon_team_a/features/game_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Game extends AutoDisposeNotifier<GameState> {
  Game();

  void tapPoint(Offset offset) {
    final newMap = Map<TapPoint, bool>.from(state.diffPoints);
    var isCorrect = false;
    for (var element in state.diffPoints.entries) {
      if (element.key.isTap(offset)) {
        newMap[element.key] = true;
        isCorrect = true;
      }
    }
    if (!isCorrect) {
      reduceTimer();
    }
    state = state.copyWith(diffPoints: newMap);
  }

  void initializeAnimationController(TickerProvider tickerProvider) {
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

  void updateLevelType(LevelType value) {
    state = state.copyWith(levelType: value);
  }

  @override
  GameState build() {
    return GameState(
      diffPoints: Map.from({
        const TapPoint(offset: Offset(50, 25), radius: 10): false,
        const TapPoint(offset: Offset(100, 25), radius: 10): false,
        const TapPoint(offset: Offset(150, 80), radius: 10): false,
      }),
    );
  }
}

final gameProvider = NotifierProvider.autoDispose<Game, GameState>(Game.new);
