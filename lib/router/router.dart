import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/pages/detection/detection_page.dart';
import 'package:flutter_hackathon_team_a/pages/game/game_page.dart';
import 'package:flutter_hackathon_team_a/pages/result/result_page.dart';
import 'package:flutter_hackathon_team_a/pages/top/top_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerProvider = Provider(
  (ref) => <String, WidgetBuilder>{
    RouteName.top.name: (BuildContext context) => const TopPage(),
    RouteName.game.name: (BuildContext context) => const GamePage(),
    RouteName.result.name: (BuildContext context) => const ResultPage(),
    RouteName.detection.name: (BuildContext context) => const DetectionPage(),
  },
);

enum RouteName {
  top,
  game,
  result,
  detection,
}
