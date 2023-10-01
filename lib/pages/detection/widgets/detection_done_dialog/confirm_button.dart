// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfirmButton extends ConsumerWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        Navigator.pushNamed(context, RouteName.top.name);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            'OK！',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
