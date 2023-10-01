import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/pages/game/widgets/background.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetectionPage extends HookConsumerWidget {
  const DetectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final positionValue = useState<double>(1000);
    const double imageSize = 200;

    useEffect(() {
      positionValue.value = 0;

      return null;
    }, []);

    final image1 = useState<File?>(null);
    final image2 = useState<File?>(null);

    return Background(
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  final result = await FilePicker.platform.pickFiles(
                    type: FileType.image,
                  );
                  if (result == null) return;
                  image1.value = File(result.files.first.path!);
                },
                child: image1.value == null
                    ? Container(
                        width: imageSize,
                        height: imageSize,
                        decoration: BoxDecoration(border: Border.all()),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image_rounded,
                              size: 30,
                            ),
                            Text("ファイルをアップロード")
                          ],
                        ),
                      )
                    : Image.file(
                        image1.value!,
                        width: imageSize,
                        height: imageSize,
                      ),
              ),
              const SizedBox(width: 100),
              InkWell(
                onTap: () async {
                  final result = await FilePicker.platform.pickFiles(
                    type: FileType.image,
                  );
                  if (result == null) return;
                  image2.value = File(result.files.first.path!);
                },
                child: image2.value == null
                    ? Container(
                        width: imageSize,
                        height: imageSize,
                        decoration: BoxDecoration(border: Border.all()),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image_rounded,
                              size: 30,
                            ),
                            Text("ファイルをアップロード")
                          ],
                        ),
                      )
                    : Image.file(
                        image2.value!,
                        width: imageSize,
                        height: imageSize,
                      ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_hackathon_team_a/pages/game/widgets/background.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class DetectionPage extends HookConsumerWidget {
//   const DetectionPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final positionValue = useState<double>(1000);
//     const double imageSize = 200;

//     useEffect(() {
//       positionValue.value = 0;

//       return null;
//     }, []);

//     return Background(
//       widget: Column(
//         children: [
//           const Text("検中"),
//           Expanded(
//             child: Center(
//               child: Stack(
//                 clipBehavior: Clip.none,
//                 alignment: Alignment.center,
//                 children: [
//                   Container(
//                     color: Colors.blue,
//                     width: imageSize * 2 + 100,
//                   ),
//                   Positioned(
//                     left: 0,
//                     child: Row(
//                       children: [
//                         Image.asset(
//                           "assets/hard_02.png",
//                           width: imageSize,
//                           height: imageSize,
//                         ),
//                         Expanded(
//                           child: AnimatedContainer(
//                             duration: const Duration(seconds: 10),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     right: 0,
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: AnimatedContainer(
//                             color: Colors.red,
//                             duration: const Duration(seconds: 10),
//                           ),
//                         ),
//                         Image.asset(
//                           "assets/hard_02.png",
//                           width: imageSize,
//                           height: imageSize,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
