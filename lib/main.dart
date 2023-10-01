import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hackathon_team_a/pages/top/top_page.dart';
import 'package:flutter_hackathon_team_a/router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteName.detection.name,
      routes: ref.watch(routerProvider),
      home: const TopPage(),
    );
  }
}
