import 'package:flutter/animation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_state.freezed.dart';

@freezed
class TimerState with _$TimerState {
  const factory TimerState({
    AnimationController? animationController,
  }) = _TimerState;
  const TimerState._();
}

extension TimerStateEx on TimerState {
  bool get isInitialized => animationController != null;
}
