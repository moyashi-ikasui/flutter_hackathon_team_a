import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    required Map<TapPoint, bool> diffPoints,
    required List<TapPoint> originalDiffPoints,
    AnimationController? animationController,
    LevelType? levelType,
    required int wrongTouchingNum,
    required Result result,
    BuildContext? context,
    required bool isAngry,
  }) = _GameState;
  const GameState._();
}

extension GameStateEx on GameState {
  bool get isAnimationControllerInitialized => animationController != null;
}

enum LevelType {
  easy,
  hard,
  original,
}

extension LevelTypeExt on LevelType {
  String get name {
    switch (this) {
      case LevelType.easy:
        return 'やさしい';
      case LevelType.hard:
        return '難しい';
      case LevelType.original:
        return 'オリジナル';
    }
  }

  List<String> get imagePath {
    switch (this) {
      case LevelType.easy:
        return ['assets/easy_01.png', 'assets/easy_02.png'];
      case LevelType.hard:
        return ['assets/hard_01.png', 'assets/hard_02.png'];
      case LevelType.original:
        return ['assets/hard_01.png', 'assets/hard_02.png'];
    }
  }
}

class TapPoint {
  final Offset center;
  final double verticalSide;
  final double horizontalSide;

  const TapPoint({
    required this.center,
    required this.verticalSide,
    required this.horizontalSide,
  });

  double get minX => center.dx - (horizontalSide / 2);
  double get maxX => center.dx + (horizontalSide / 2);
  double get maxY => center.dy + (verticalSide / 2);
  double get minY => center.dy - (verticalSide / 2);

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
        return 1.0;
      case LevelType.hard:
        return 1.3;
      case LevelType.original:
        return 1;
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
