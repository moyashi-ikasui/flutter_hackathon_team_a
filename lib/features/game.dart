import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hackathon_team_a/constants/const.dart';
import 'package:flutter_hackathon_team_a/features/game_end_type.dart';
import 'package:flutter_hackathon_team_a/features/game_state.dart';
import 'package:flutter_hackathon_team_a/pages/game/widgets/game_end_dialog/game_end_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:collection/collection.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:image/image.dart' as img;

class Game extends AutoDisposeNotifier<GameState> {
  Game();

  final wrongAnswerPlayer = AssetsAudioPlayer();
  final correctAnswerPlayer = AssetsAudioPlayer();
  final bgmPlayer = AssetsAudioPlayer();
  final analyzingPlayer = AssetsAudioPlayer();

  Future<void> setupPlayer() {
    return Future.wait([
      wrongAnswerPlayer.open(
        Audio("assets/sounds/wrong_answer.mp3"),
        autoStart: false,
        showNotification: true,
      ),
      correctAnswerPlayer.open(
        Audio("assets/sounds/correct_answer.mp3"),
        autoStart: false,
        showNotification: true,
      ),
      bgmPlayer.open(
        Audio("assets/sounds/bgm.mp3"),
        autoStart: false,
        showNotification: true,
        loopMode: LoopMode.single,
      ),
      analyzingPlayer.open(
        Audio("assets/sounds/analyzing.mp3"),
        autoStart: false,
        showNotification: true,
        loopMode: LoopMode.single,
      ),
    ]);
  }

  void listenRemainingTime(double value) {
    if (0.5 < value && bgmPlayer.playSpeed.value == 1) {
      bgmPlayer.setPlaySpeed(1.5);
    }
  }

  void tapPoint(Offset offset) {
    final newMap = Map<TapPoint, bool>.from(state.diffPoints);

    final tappedPoint = state.diffPoints.entries
        .firstWhereOrNull((element) => element.key.isTap(offset));

    // タップしたポイントが存在しない場合
    if (tappedPoint == null) {
      wrongAnswerPlayer.play();
      state = state.copyWith(wrongTouchingNum: state.wrongTouchingNum + 1);
      reduceTimer();
    } else {
      correctAnswerPlayer.play();
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
    bgmPlayer.setPlaySpeed(1);
    state.animationController!.forward();
    state.animationController!.addListener(() {
      if (!state.isAngry && state.animationController!.value > 0.8) {
        state = state.copyWith(isAngry: true);
      }
      listenRemainingTime(state.animationController!.value);
    });
    state.animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        bgmPlayer.stop();
        showDialog(
          context: state.context!,
          barrierDismissible: false,
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

  Future<void> updateLevelType(LevelType value) {
    state = state.copyWith(levelType: value);
    if (state.animationController != null) {
      // アニメーションを初期化
      state.animationController!.reset();
    }
    // diffPointsの値を変える
    if (value == LevelType.easy) {
      state = state.copyWith(
          diffPoints: Map.from({
        const TapPoint(
          center: Offset(100, 15),
          verticalSide: 15,
          horizontalSide: 40,
        ): false,
        const TapPoint(
            center: Offset(100, 50),
            verticalSide: 15,
            horizontalSide: 30): false,
        const TapPoint(
            center: Offset(100, 110),
            verticalSide: 50,
            horizontalSide: 50): false,
      }));
    }
    if (value == LevelType.hard) {
      state = state.copyWith(
        diffPoints: Map.from({
          const TapPoint(
              center: Offset(110, 40),
              verticalSide: 10,
              horizontalSide: 35): false,
          const TapPoint(
            center: Offset(105, 64),
            verticalSide: 10,
            horizontalSide: 35,
          ): false,
          const TapPoint(
              center: Offset(140, 90),
              verticalSide: 15,
              horizontalSide: 10): false,
          const TapPoint(
              center: Offset(105, 95),
              verticalSide: 10,
              horizontalSide: 15): false,
        }),
      );
    }
    if (value == LevelType.original) {
      state = state.copyWith(diffPoints: Map.fromEntries(
        state.originalDiffPoints.map((e) {
          return MapEntry(
            e,
            false,
          );
        }),
      ));
    }
    return imagePath().then((value) {
      state = state.copyWith(
        image1: value[0],
        image2: value[1],
      );
    });
  }

  Future<void> uploadOriginal(File file1, File file2) async {
    final result =
        await Future.wait([file1.readAsBytes(), file2.readAsBytes()]);
    return diffImage(file1, file2).then((value) {
      state = state.copyWith(
        originalDiffPoints: value,
        originalImage1: result[0],
        originalImage2: result[1],
      );
    });
  }

  void finishGame() {
    bgmPlayer.stop();
    state = state.copyWith(
      result: Result(
        remainingTime: gameTimeSec -
            (state.animationController!.value * gameTimeSec).toInt(),
        level: state.levelType!,
        correctAnswersNum:
            state.diffPoints.values.where((element) => element).toList().length,
        issuesNum: state.diffPoints.values.length,
        wrongTouchingNum: state.wrongTouchingNum,
      ),
    );
  }

  List<List<img.Point>> findConnectedComponents(List<img.Point> points) {
    List<List<img.Point>> components = [];
    Set<img.Point> unusedPoints = points.toSet();

    while (unusedPoints.isNotEmpty) {
      var startPoint = unusedPoints.first;
      var component = <img.Point>[];
      var stack = [startPoint];

      while (stack.isNotEmpty) {
        var current = stack.removeLast();
        if (unusedPoints.contains(current)) {
          unusedPoints.remove(current);
          component.add(current);

          // 隣接する点をスタックに追加
          for (var dx = -1; dx <= 1; dx++) {
            for (var dy = -1; dy <= 1; dy++) {
              var neighbor =
                  img.Point(current.x + dx, current.y + dy); // 隣接ポイント
              if (unusedPoints.contains(neighbor)) {
                stack.add(neighbor);
              }
            }
          }
        }
      }

      components.add(component);
    }

    return components;
  }

  Future<List<TapPoint>> diffImage(File imageFile1, File imageFile2) async {
    img.Image? image1 = img.decodeImage(imageFile1.readAsBytesSync());
    img.Image? image2 = img.decodeImage(imageFile2.readAsBytesSync());

    List<img.Point> changedPoints = []; //

    for (int y = 0; y < image1!.height; y++) {
      for (int x = 0; x < image1.width; x++) {
        final pixelColor1 = image1.getPixel(x, y);
        final pixelColor2 = image2!.getPixel(x, y);

        if (pixelColor1.r != pixelColor2.r ||
            pixelColor1.g != pixelColor2.g ||
            pixelColor1.b != pixelColor2.b ||
            pixelColor1.a != pixelColor2.a) {
          changedPoints.add(img.Point(x, y));
        }
      }
    }

// 使用例
    final components = findConnectedComponents(changedPoints);

    return components.map((points) {
      final maxX = points.reduce((curr, next) => curr.x > next.x ? curr : next);
      final minX = points.reduce((curr, next) => curr.x < next.x ? curr : next);
      final maxY = points.reduce((curr, next) => curr.y > next.y ? curr : next);
      final minY = points.reduce((curr, next) => curr.y < next.y ? curr : next);

      final verticalSide = maxY.y.toDouble() - minY.y.toDouble();
      final horizontalSide = maxX.x.toDouble() - minX.x.toDouble();

      return TapPoint(
        center: Offset(
          minX.x + (horizontalSide / 2),
          minY.y + (verticalSide / 2),
        ),
        verticalSide: verticalSide,
        horizontalSide: horizontalSide,
      );
    }).toList();
  }

  Future<List<Uint8List>> imagePath() async {
    rootBundle.load('assets/easy_01.png');

    rootBundle.load('assets/hard_02.png');

    switch (state.levelType!) {
      case LevelType.easy:
        return [
          await rootBundle
              .load('assets/easy_01.png')
              .then((value) => value.buffer.asUint8List()),
          await rootBundle
              .load('assets/easy_02.png')
              .then((value) => value.buffer.asUint8List()),
        ];
      case LevelType.hard:
        return [
          await rootBundle
              .load('assets/hard_01.png')
              .then((value) => value.buffer.asUint8List()),
          await rootBundle
              .load('assets/hard_02.png')
              .then((value) => value.buffer.asUint8List()),
        ];
      case LevelType.original:
        return [
          state.originalImage1!,
          state.originalImage2!,
        ];
    }
  }

  @override
  GameState build() {
    setupPlayer();
    ref.onDispose(() {
      bgmPlayer.dispose();
      wrongAnswerPlayer.dispose();
      correctAnswerPlayer.dispose();
      analyzingPlayer.dispose();
    });

    return GameState(
      image1: null,
      image2: null,
      originalImage1: null,
      originalImage2: null,
      originalDiffPoints: [],
      diffPoints: Map.from({}),
      wrongTouchingNum: 0,
      result: const Result(
        remainingTime: 1,
        level: LevelType.easy,
        correctAnswersNum: 0,
        issuesNum: 0,
        wrongTouchingNum: 0,
      ),
      isAngry: false,
    );
  }
}

final gameProvider = NotifierProvider.autoDispose<Game, GameState>(Game.new);
