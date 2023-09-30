// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/router/router.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
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
