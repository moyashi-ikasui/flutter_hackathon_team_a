import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/features/game.dart';
import 'package:flutter_hackathon_team_a/features/game_state.dart';
import 'package:flutter_hackathon_team_a/pages/game/widgets/background.dart';
import 'package:flutter_hackathon_team_a/router/router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ResultPage extends HookConsumerWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gameProvider);
    final diffPointsList =
        useMemoized(() => state.diffPoints.entries.toList(), [
      state.diffPoints,
    ]);
    final diffImg = state.image1;
    final defaultImg = state.image2;

    const defaultOriginalSize = 200;
    const scale = 120 / defaultOriginalSize;
    const double minimumCircleSize = 20;

    double left(TapPoint tapPoint, LevelType level) {
      if (level != LevelType.original) {
        return tapPoint.minX;
      }
      final side = tapPoint.horizontalSide > minimumCircleSize
          ? tapPoint.horizontalSide
          : minimumCircleSize;
      return tapPoint.center.dx - (side / 2);
    }

    double top(TapPoint tapPoint, LevelType level) {
      if (level != LevelType.original) {
        return tapPoint.minY;
      }
      final side = tapPoint.verticalSide > minimumCircleSize
          ? tapPoint.verticalSide
          : minimumCircleSize;
      return tapPoint.center.dy - (side / 2);
    }

    return Scaffold(
      body: Background(
        widget: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "正解は...",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Row(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: Image.memory(
                                diffImg!,
                                fit: BoxFit.contain,
                              ),
                            ),
                            ...diffPointsList
                                .map(
                                  (e) => Positioned(
                                    left: left(e.key, state.levelType!) * scale,
                                    top: top(e.key, state.levelType!) * scale,
                                    child: Container(
                                      width: 25 * scale,
                                      height: 25 * scale,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                          color: Colors.red,
                                          width: 5,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ],
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.memory(
                            defaultImg!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 290,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      state.result.totalScore > 20000
                          ? const Text(
                              "最高の彼氏",
                              style: TextStyle(
                                fontSize: 38,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          : const Text(
                              "もうちょっと頑張って",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                      const SizedBox(
                        width: 290,
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "パーフェクトボーナス",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Text(
                            state.result.hasPerfectBonus ? "あり" : "なし",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "難易度ボーナス",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Text(
                            state.result.hasLevelBonus ? "あり" : "なし",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "お手つき",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Text(
                            "${state.result.wrongTouchingNum}回",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "残り時間",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Text(
                            "${state.result.remainingTime}秒",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 290,
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "スコア",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Text(
                            NumberFormat("#,###.0")
                                .format(state.result.totalScore),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, RouteName.top.name),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: Image.asset(
                                "assets/dash.png",
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Topに戻る',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
