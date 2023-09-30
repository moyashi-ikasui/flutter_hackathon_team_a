import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    required Map<TapPoint, bool> diffPoints,
  }) = _GameState;
  const GameState._();
}

class TapPoint {
  final Offset offset;
  final double radius;

  const TapPoint({
    required this.offset,
    required this.radius,
  });

  double get minX => offset.dx - radius;
  double get maxX => offset.dx + radius;
  double get maxY => offset.dy + radius;
  double get minY => offset.dy - radius;

  bool isTap(Offset tapPoint) {
    return minX < tapPoint.dx &&
        maxX > tapPoint.dx &&
        minY < tapPoint.dy &&
        maxY > tapPoint.dy;
  }
}
