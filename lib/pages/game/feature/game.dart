import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/pages/game/feature/game_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Game extends AutoDisposeNotifier<GameState> {
  Game();

  void tapPoint(Offset offset) {
    final newMap = Map<TapPoint, bool>.from(state.diffPoints);
    for (var element in state.diffPoints.entries) {
      if (element.key.isTap(offset)) {
        newMap[element.key] = true;
      }
    }
    state = state.copyWith(diffPoints: newMap);
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
