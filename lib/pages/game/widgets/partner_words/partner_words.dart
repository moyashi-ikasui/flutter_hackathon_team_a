import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animated_widgets/widgets/rotation_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_team_a/features/game.dart';
import 'package:flutter_hackathon_team_a/util/size_helper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PartnerWords extends HookConsumerWidget {
  const PartnerWords({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: context.height * .1,
      child: Center(
        child: !ref.watch(gameProvider).isAngry
            ? AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [
                  TypewriterAnimatedText(
                    'ねぇ、今日いつもとどこか違うと思わない？',
                    speed: const Duration(milliseconds: 250),
                    textStyle:
                        GoogleFonts.zenMaruGothic(fontWeight: FontWeight.bold),
                    cursor: '💕',
                  ),
                  TypewriterAnimatedText(
                    'もちろん、わかるよね？？',
                    speed: const Duration(milliseconds: 250),
                    textStyle:
                        GoogleFonts.zenMaruGothic(fontWeight: FontWeight.bold),
                    cursor: '💕',
                  ),
                  TypewriterAnimatedText(
                    'うんうん、他には？',
                    speed: const Duration(milliseconds: 250),
                    textStyle:
                        GoogleFonts.zenMaruGothic(fontWeight: FontWeight.bold),
                    cursor: '💕',
                  ),
                  TypewriterAnimatedText(
                    'え、それだけ？',
                    speed: const Duration(milliseconds: 250),
                    textStyle:
                        GoogleFonts.zenMaruGothic(fontWeight: FontWeight.bold),
                    cursor: '🫤',
                  ),
                  TypewriterAnimatedText(
                    'ほらー、もったいぶらなくていいからさ！',
                    speed: const Duration(milliseconds: 250),
                    textStyle:
                        GoogleFonts.zenMaruGothic(fontWeight: FontWeight.bold),
                    cursor: '💕',
                  ),
                  TypewriterAnimatedText(
                    '...もしかして本当にわからない？',
                    speed: const Duration(milliseconds: 250),
                    textStyle:
                        GoogleFonts.zenMaruGothic(fontWeight: FontWeight.bold),
                    cursor: '😔',
                  ),
                  TypewriterAnimatedText(
                    '今なら許してあげるからさ！早く言ってよ！',
                    speed: const Duration(milliseconds: 250),
                    textStyle:
                        GoogleFonts.zenMaruGothic(fontWeight: FontWeight.bold),
                    cursor: '😠',
                  ),
                ],
              )
            : ShakeAnimatedWidget(
                duration: const Duration(milliseconds: 100),
                shakeAngle: Rotation.deg(z: 4),
                child: AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      '早く見つけてよ！！！！！💢💢💢',
                      speed: const Duration(milliseconds: 250),
                      textStyle: GoogleFonts.zenMaruGothic(
                          fontWeight: FontWeight.bold),
                      cursor: '💢',
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
