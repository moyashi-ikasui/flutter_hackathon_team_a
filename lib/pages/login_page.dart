import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/pages/feature/login.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginProvider);
    return Scaffold(
      body: Column(children: [
        Text(state.phoneNumber),
      ]),
    );
  }
}
