import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/features/game.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ResultPage extends HookConsumerWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gameProvider);
    return Scaffold(
      body: Row(
        children: [
          Column(
            children: const [
              Text("違う箇所"),
              Text("ピアス"),
              Text("アイメイク"),
              Text("髪型"),
            ],
          ),
          Column(
            children: [
              const Divider(),
              const Text("最高の彼氏"), //TODO
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("パーフェクトボーナス"),
                  Text(state.result.hasPerfectBonus ? "あり" : "なし"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("難易度ボーナス"),
                  Text(state.result.hasLevelBonus ? "あり" : "なし"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("お手つき"),
                  Text("${state.result.wrongTouchingNum}回"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("残り時間"),
                  Text("${state.result.remainingTime}秒"),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("スコア"),
                  Text(NumberFormat("#,###.0").format(state.result.totalScore)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
