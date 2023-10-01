// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/pages/detection/widgets/detection_done_dialog/confirm_button.dart';
import 'package:flutter_hackathon_team_a/util/spacer.dart';

class DetectionEndDialog extends StatelessWidget {
  const DetectionEndDialog({
    super.key,
  });

  Widget _buildMessage() {
    return const Center(
      child: Text(
        '差分解析完了！！',
        style: TextStyle(
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
