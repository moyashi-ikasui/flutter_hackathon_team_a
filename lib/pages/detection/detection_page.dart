import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/pages/detection/widgets/animation_box.dart';
import 'package:flutter_hackathon_team_a/features/game.dart';
import 'package:flutter_hackathon_team_a/pages/detection/widgets/detection_done_dialog/detection_end_dialog.dart';
import 'package:flutter_hackathon_team_a/pages/game/widgets/background.dart';
import 'package:flutter_hackathon_team_a/util/size_helper.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetectionPage extends StatefulHookConsumerWidget {
  const DetectionPage({Key? key}) : super(key: key);

  @override
  DetectionPageState createState() => DetectionPageState();
}

class DetectionPageState extends ConsumerState<DetectionPage> {
  static const double imageSize = 200;
  Future<void> runAnalyzeAnimation() async {
    setState(() {
      isAnalyzing = true;
    });
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      showAnimationBox = true;
    });
    await Future.delayed(const Duration(milliseconds: 1000));
  }

  bool isAnalyzing = false;
  bool showAnimationBox = false;

  @override
  Widget build(BuildContext context) {
    final image1 = useState<File?>(null);
    final image2 = useState<File?>(null);

    useEffect(() {
      if (image1.value != null && image2.value != null) {
        ref
            .read(gameProvider.notifier)
            .uploadOriginal(image1.value!, image2.value!)
            .then((value) {
          runAnalyzeAnimation().then((value) {
            showDialog(
              context: context,
              builder: (context) {
                return const DetectionEndDialog();
              },
            );
          });
        });
      }
      return null;
    }, [image1.value, image2.value]);

    return Background(
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: context.width * 0.6,
                child: AnimatedAlign(
                  curve: Curves.easeOut,
                  alignment:
                      isAnalyzing ? Alignment.center : Alignment.centerLeft,
                  duration: const Duration(milliseconds: 1000),
                  child: InkWell(
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
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
                ),
              ),
              SizedBox(
                width: context.width * 0.6,
                child: AnimatedAlign(
                  curve: Curves.easeOut,
                  alignment:
                      isAnalyzing ? Alignment.center : Alignment.centerRight,
                  duration: const Duration(milliseconds: 1000),
                  child: InkWell(
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
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
                ),
              ),
              if (showAnimationBox) const AnimationBox(),
            ],
          ),
        ],
      ),
    );
  }
}
