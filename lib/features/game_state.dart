import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    required Map<TapPoint, bool> diffPoints,
    AnimationController? animationController,
    LevelType? levelType,
    required int wrongTouchingNum,
    required Result result,
    BuildContext? context,
  }) = _GameState;
  const GameState._();
}

extension GameStateEx on GameState {
  bool get isAnimationControllerInitialized => animationController != null;
}

enum LevelType {
  easy,
  hard,
}

extension LevelTypeExt on LevelType {
  String get name {
    switch (this) {
      case LevelType.easy:
        return 'やさしい';
      case LevelType.hard:
        return '難しい';
    }
  }
}

class TapPoint {
  final Offset offset;
  final double radius;

  const TapPoint({
    required this.offset,
    required this.radius,
  });

  double get minX => offset.dx - radius;
  double get maxX => offset.dx + radius;
  double get maxY => offset.dy + radius;
  double get minY => offset.dy - radius;

  bool isTap(Offset tapPoint) {
    return minX < tapPoint.dx &&
        maxX > tapPoint.dx &&
        minY < tapPoint.dy &&
        maxY > tapPoint.dy;
  }
}

class Result {
  const Result({
    required this.remainingTime,
    required this.level,
    required this.correctAnswersNum,
    required this.issuesNum,
    required this.wrongTouchingNum,
  });
  final int remainingTime;
  final LevelType level;
  final int correctAnswersNum;
  final int issuesNum;
  final int wrongTouchingNum;

  int get remainingTimeBonus {
    return (remainingTime * 250);
  }

  int get correctAnswersBonus {
    final percentageOfCorrectAnswers = correctAnswersNum / issuesNum;
    return (percentageOfCorrectAnswers * 10000).ceil();
  }

  double get levelBonus {
    switch (level) {
      case LevelType.easy:
        return 1;
      case LevelType.hard:
        return 1.3;
    }
  }

  double get perfectBonus {
    if (correctAnswersNum == issuesNum) {
      return 5000;
    }
    return 0;
  }

  bool get hasPerfectBonus {
    return correctAnswersNum == issuesNum;
  }

  bool get hasLevelBonus {
    return level == LevelType.hard;
  }

  int get totalScore {
    return (remainingTimeBonus +
            correctAnswersBonus +
            perfectBonus +
            wrongTouchingNum * levelBonus)
        .ceil();
  }
}
