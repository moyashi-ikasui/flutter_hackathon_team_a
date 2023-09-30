import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/pages/game/feature/game.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GamePage extends HookConsumerWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gameProvider);

    final diffPointsList = useMemoized(() => state.diffPoints.entries.toList());

    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTapDown: (tapDownDetails) {
              ref
                  .read(gameProvider.notifier)
                  .tapPoint(tapDownDetails.localPosition);
            },
            child: Stack(
              children: [
                Image.asset("assets/woman.png"),
                ...diffPointsList
                    .map(
                      (e) => Positioned(
                        left: e.key.minX,
                        top: e.key.minY,
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                color: state.diffPoints[e.key]!
                                    ? Colors.red
                                    : Colors.transparent,
                                width: 5),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Image.asset("assets/woman.png"),
        ],
      ),
    );
  }
}
