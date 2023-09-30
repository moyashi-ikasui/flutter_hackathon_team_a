// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/features/game.dart';
import 'package:flutter_hackathon_team_a/router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfirmButton extends ConsumerWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        ref.read(gameProvider.notifier).finishGame();
        Navigator.pushNamed(context, RouteName.result.name);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Text(
          '結果を見る',
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
