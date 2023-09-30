import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hackathon_team_a/pages/top/top_page.dart';
import 'package:flutter_hackathon_team_a/router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image/image.dart' as img;
import 'dart:io';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    diffImage();
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
      initialRoute: RouteName.top.name,
      routes: ref.watch(routerProvider),
      home: const TopPage(),
    );
  }
}

List<List<img.Point>> findConnectedComponents(List<img.Point> points) {
  List<List<img.Point>> components = [];
  Set<img.Point> unvisited = points.toSet();

  while (unvisited.isNotEmpty) {
    var start = unvisited.first;
    var component = <img.Point>[];
    var stack = [start];

    while (stack.isNotEmpty) {
      var current = stack.removeLast();
      if (unvisited.contains(current)) {
        unvisited.remove(current);
        component.add(current);

        // 隣接する点をスタックに追加
        for (var dx = -1; dx <= 1; dx++) {
          for (var dy = -1; dy <= 1; dy++) {
            var neighbor = img.Point(current.x + dx, current.y + dy);
            if (unvisited.contains(neighbor)) {
              stack.add(neighbor);
            }
          }
        }
      }
    }

    components.add(component);
  }

  return components;
}

img.Point computeCentroid(List<img.Point> points) {
  int sumX = 0;
  int sumY = 0;
  for (var point in points) {
    sumX += point.x.toInt();
    sumY += point.y.toInt();
  }
  return img.Point(sumX / points.length, sumY / points.length);
}

void diffImage() {
  img.Image? image1 =
      img.decodeImage(File('assets/easy_01.png').readAsBytesSync());
  img.Image? image2 =
      img.decodeImage(File('assets/easy_02.png').readAsBytesSync());

  List<img.Point> changedPoints = [];

  for (int y = 0; y < image1!.height; y++) {
    for (int x = 0; x < image1.width; x++) {
      final pixelColor1 = image1.getPixel(x, y);
      final pixelColor2 = image2!.getPixel(x, y);

      if (pixelColor1.r == pixelColor2.r &&
          pixelColor1.g == pixelColor2.g &&
          pixelColor1.b == pixelColor2.b &&
          pixelColor1.a == pixelColor2.a) {
        changedPoints.add(img.Point(x, y));
      }
    }
  }

  changedPoints[0].x;

// 使用例
  var components = findConnectedComponents(changedPoints);
  List<img.Point> centroids = components.map(computeCentroid).toList();
  print("aaaaaaaa");
  print(centroids);
}
