import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/features/game.dart';
import 'package:flutter_hackathon_team_a/features/game_state.dart';
import 'package:flutter_hackathon_team_a/pages/game/widgets/submit_button.dart';
import 'package:flutter_hackathon_team_a/pages/game/widgets/background.dart';
import 'package:flutter_hackathon_team_a/pages/game/widgets/timer_bar_wrapper.dart';
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
    final controller = useRef<AnimationController?>(null);

    // void reduceTimer() {
    //   final newValue = controller.value!.value + (timeReduceSec / gameTimeSec);
    //   final isNewValueNegative = newValue > 1;
    //   final fixedNewValue = isNewValueNegative ? 1.0 : newValue;
    //   controller.value!.forward(from: fixedNewValue);
    // }

    // useValueChanged(
    //     state.wrongTouchingNum, (oldValue, oldResult) => {reduceTimer()});

    return Scaffold(
      body: Background(
        widget: Column(
          children: [
            Row(
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
                              left: e.key.minX,
                              top: e.key.minY,
                              child: Container(
                                width: 25,
                                height: 25,
                                alignment: Alignment.center,
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
            const HSpacer(height: 12),
            const SubmitButton(),
            const HSpacer(height: 12),
            const TimerBarWrapper(),
          ],
        ),
      ),
    );
  }
}
