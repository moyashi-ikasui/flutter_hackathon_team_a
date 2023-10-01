import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/features/game.dart';
import 'package:flutter_hackathon_team_a/features/game_state.dart';
import 'package:flutter_hackathon_team_a/pages/game/widgets/background.dart';
import 'package:flutter_hackathon_team_a/router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ResultPage extends HookConsumerWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gameProvider);
    final diffImg = state.levelType?.imagePath[0];
    final defaultImg = state.levelType?.imagePath[1];

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
                    Row(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.asset(
                            diffImg ?? "assets/woman.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.asset(
                            defaultImg ?? "assets/woman.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      "違う箇所",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "ピアス",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Text(
                      "アイメイク",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Text(
                      "髪型",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "最高の彼氏",
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      width: 240,
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
                      width: 240,
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
                    Row(
                      children: [
                        InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, RouteName.top.name),
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset(
                              "assets/dash.png",
                            ),
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
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
