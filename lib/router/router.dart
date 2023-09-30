import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/pages/game_page.dart';
import 'package:flutter_hackathon_team_a/pages/login_page.dart';
import 'package:flutter_hackathon_team_a/pages/result_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerProvider = Provider(
  (ref) => <String, WidgetBuilder>{
    RouteName.login.name: (BuildContext context) => const LoginPage(),
    RouteName.game.name: (BuildContext context) => const GamePage(),
    RouteName.result.name: (BuildContext context) => const ResultPage(),
  },
);

enum RouteName {
  login,
  game,
  result,
}
