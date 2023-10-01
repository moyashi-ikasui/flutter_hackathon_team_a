// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/features/game_end_type.dart';
import 'package:flutter_hackathon_team_a/pages/game/widgets/game_end_dialog/confirm_button.dart';
import 'package:flutter_hackathon_team_a/util/spacer.dart';

class GameEndDialog extends StatelessWidget {
  const GameEndDialog({
    required this.gameEndType,
    super.key,
  });

  final GameEndType gameEndType;

  Widget _buildMessage() {
    return Center(
      child: Text(
        gameEndType.dialogMessage,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 50),
      content: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30),
              _buildMessage(),
              const HSpacer(height: 35),
              const ConfirmButton(),
            ],
          ),
        ),
      ),
    );
  }
}
