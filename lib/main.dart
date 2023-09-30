import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hackathon_team_a/pages/top/top_page.dart';
import 'package:flutter_hackathon_team_a/router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

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
      initialRoute: RouteName.top.name,
      routes: ref.watch(routerProvider),
      home: const TopPage(),
    );
  }
}

// List<img.Image> findDifferences(img.Image image1, img.Image image2) {
//   // 画像間の差分を取得
//   final diff = img.Image.empty(10, image1.height);
//   for (int y = 0; y < image1.height; y++) {
//     for (int x = 0; x < image1.width; x++) {
//       if (image1.getPixel(x, y) != image2.getPixel(x, y)) {
//         diff.setPixel(x, y, image1.getColor(255, 255, 255, 255)); // 白色
//       } else {
//         diff.setPixel(x, y, img.getColor(0, 0, 0, 0)); // 透明（または黒色）
//       }
//     }
//   }

//   // 二値化
//   img.Image thresholded = img.threshold(diff, 128);

//   // 輪郭検出
//   List<List<img.Point>> contours = img.findContours(thresholded);

//   // 各輪郭の中心点やバウンディングボックスを計算
//   List<img.Image> resultImages = [];
//   for (var contour in contours) {
//     img.Rectangle boundingBox = img.boundingBox(contour);
//     img.Image result = img.Image.from(thresholded);
//     for (var point in contour) {
//       result.setPixel(
//           point.x, point.y, img.getColor(255, 0, 0, 255)); // 輪郭を赤色で描画
//     }
//     // バウンディングボックスや中心点の計算・描画をここで追加できます
//     resultImages.add(result);
//   }

//   return resultImages;
// }

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

Future<List<img.Point>> diffImage() async {
  final imageFile1 = await getImageFileFromAssets('hard_01.png');
  final imageFile2 = await getImageFileFromAssets('hard_02.png');
  img.Image? image1 = img.decodeImage(imageFile1.readAsBytesSync());
  img.Image? image2 = img.decodeImage(imageFile2.readAsBytesSync());

  List<img.Point> changedPoints = [];

  for (int y = 0; y < image1!.height; y++) {
    for (int x = 0; x < image1.width; x++) {
      final pixelColor1 = image1.getPixel(x, y);
      final pixelColor2 = image2!.getPixel(x, y);

      if (pixelColor1.r != pixelColor2.r ||
          pixelColor1.g != pixelColor2.g ||
          pixelColor1.b != pixelColor2.b ||
          pixelColor1.a != pixelColor2.a) {
        changedPoints.add(img.Point(x, y));
      }
    }
  }

// 使用例
  var components = findConnectedComponents(changedPoints);
  List<img.Point> centroids = components.map(computeCentroid).toList();
  return centroids;
}

Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');

  final file = File('${(await getApplicationDocumentsDirectory()).path}/$path');
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
}
