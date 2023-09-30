import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/features/game.dart';
import 'package:flutter_hackathon_team_a/features/game_state.dart';
import 'package:flutter_hackathon_team_a/pages/game/widgets/background.dart';
import 'package:flutter_hackathon_team_a/router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopPage extends HookConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(gameProvider);
    return Scaffold(
      body: Background(
        widget: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '彼氏優秀度チェカー',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          ref
                              .read(gameProvider.notifier)
                              .updateLevelType(LevelType.easy);
                          Navigator.pushNamed(context, RouteName.game.name);
                        },
                        child: Text(
                          LevelType.easy.name,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                      const SizedBox(width: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          ref
                              .read(gameProvider.notifier)
                              .updateLevelType(LevelType.hard);
                          Navigator.pushNamed(context, RouteName.game.name);
                        },
                        child: Text(
                          LevelType.hard.name,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset('assets/dash.png'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
