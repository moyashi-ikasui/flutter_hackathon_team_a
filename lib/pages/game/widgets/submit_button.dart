import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/features/game_end_type.dart';
import 'package:flutter_hackathon_team_a/pages/game/widgets/game_end_dialog/game_end_dialog.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: const Color(0xffFF9600),
        shape: const StadiumBorder(),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return const GameEndDialog(
              gameEndType: GameEndType.finish,
            );
          },
        );
      },
      child: const Text(
        'これで全てだと思う！',
        style: TextStyle(
          fontSize: 28,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
