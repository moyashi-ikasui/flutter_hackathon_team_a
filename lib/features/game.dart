import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/constants/const.dart';
import 'package:flutter_hackathon_team_a/features/game_end_type.dart';
import 'package:flutter_hackathon_team_a/features/game_state.dart';
import 'package:flutter_hackathon_team_a/pages/game/widgets/game_end_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:collection/collection.dart';
import 'package:just_audio/just_audio.dart';

class Game extends AutoDisposeNotifier<GameState> {
  Game();

  void tapPoint(Offset offset) {
    // final wrongAnswerPlayer = AudioPlayer()
    //   ..setAsset("assets/sounds/wrong_answer.mp3");
    // final correctAnswerPlayer = AudioPlayer()
    //   ..setAsset("assets/sounds/correct_answer.mp3");
    final newMap = Map<TapPoint, bool>.from(state.diffPoints);

    final tappedPoint = state.diffPoints.entries
        .firstWhereOrNull((element) => element.key.isTap(offset));

    // タップしたポイントが存在しない場合
    if (tappedPoint == null) {
      // wrongAnswerPlayer.play();
      reduceTimer();
      state = state.copyWith(wrongTouchingNum: state.wrongTouchingNum + 1);
    } else {
      // correctAnswerPlayer.play();
      newMap[tappedPoint.key] = true;
      state = state.copyWith(diffPoints: newMap);
    }
  }

  void initializeAnimationController(
    TickerProvider tickerProvider,
    BuildContext context,
  ) {
    state = state.copyWith(
        animationController: AnimationController(
          vsync: tickerProvider,
          duration: const Duration(seconds: gameTimeSec),
        ),
        context: context);
    startTimer();
  }

  void startTimer() {
    state.animationController!.forward();
    state.animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        showDialog(
          context: state.context!,
          builder: (context) {
            return const GameEndDialog(
              gameEndType: GameEndType.timeUp,
            );
          },
        );
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

  void finishGame() {
    state = state.copyWith(
      result: Result(
        remainingTime: (state.animationController!.value * gameTimeSec).toInt(),
        level: LevelType.easy, // TODO,
        correctAnswersNum:
            state.diffPoints.values.where((element) => element).toList().length,
        issuesNum: state.diffPoints.values.length,
        wrongTouchingNum: state.wrongTouchingNum,
      ),
    );
  }

  @override
  GameState build() {
    return GameState(
      diffPoints: Map.from({
        const TapPoint(offset: Offset(50, 25), radius: 10): false,
        const TapPoint(offset: Offset(100, 25), radius: 10): false,
        const TapPoint(offset: Offset(150, 80), radius: 10): false,
      }),
      wrongTouchingNum: 0,
      result: const Result(
        remainingTime: 1,
        level: LevelType.easy,
        correctAnswersNum: 0,
        issuesNum: 0,
        wrongTouchingNum: 0,
      ),
    );
  }
}

final gameProvider = NotifierProvider.autoDispose<Game, GameState>(Game.new);
