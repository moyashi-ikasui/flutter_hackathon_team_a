import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/features/game.dart';
import 'package:flutter_hackathon_team_a/features/game_state.dart';
import 'package:flutter_hackathon_team_a/pages/game/widgets/submit_button.dart';
import 'package:flutter_hackathon_team_a/pages/game/widgets/background.dart';
import 'package:flutter_hackathon_team_a/util/spacer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GamePage extends HookConsumerWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gameProvider);
    final diffImg = state.levelType?.imagePath[0];
    final defaultImg = state.levelType?.imagePath[1];

    final diffPointsList = useMemoized(() => state.diffPoints.entries.toList());

    const double minimumCircleSize = 20;

    double left(TapPoint tapPoint) {
      final side = tapPoint.horizontalSide > minimumCircleSize
          ? tapPoint.horizontalSide
          : minimumCircleSize;
      return tapPoint.center.dx - (side / 2);
    }

    double top(TapPoint tapPoint) {
      final side = tapPoint.verticalSide > minimumCircleSize
          ? tapPoint.verticalSide
          : minimumCircleSize;
      return tapPoint.center.dy - (side / 2);
    }

    return Scaffold(
      body: Background(
        widget: Column(
          children: [
            // const PartnerWords(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset(
                        diffImg ?? "assets/woman.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    ...diffPointsList
                        .map(
                          (e) => Positioned(
                            left: left(e.key),
                            top: top(e.key),
                            child: GestureDetector(
                              onTap: () => {
                                ref
                                    .read(gameProvider.notifier)
                                    .tapPoint(e.key.center)
                              },
                              child: Container(
                                constraints: const BoxConstraints(
                                  minWidth: minimumCircleSize,
                                  minHeight: minimumCircleSize,
                                ),
                                width: e.key.horizontalSide,
                                height: e.key.verticalSide,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9999),
                                  border: Border.all(
                                      color: state.diffPoints[e.key]!
                                          ? Colors.red
                                          : Colors.transparent,
                                      width: 5),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    defaultImg ?? "assets/woman.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            const HSpacer(height: 8),
            const SubmitButton(),
            const HSpacer(height: 8),
            // const TimerBarWrapper(),
          ],
        ),
      ),
    );
  }
}
