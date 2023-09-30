// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameState {
  Map<TapPoint, bool> get diffPoints => throw _privateConstructorUsedError;
  AnimationController? get animationController =>
      throw _privateConstructorUsedError;
  LevelType? get levelType => throw _privateConstructorUsedError;
  int get wrongTouchingNum => throw _privateConstructorUsedError;
  Result get result => throw _privateConstructorUsedError;
  BuildContext? get context => throw _privateConstructorUsedError;
  bool get isAngry => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call(
      {Map<TapPoint, bool> diffPoints,
      AnimationController? animationController,
      LevelType? levelType,
      int wrongTouchingNum,
      Result result,
      BuildContext? context,
      bool isAngry});
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diffPoints = null,
    Object? animationController = freezed,
    Object? levelType = freezed,
    Object? wrongTouchingNum = null,
    Object? result = null,
    Object? context = freezed,
    Object? isAngry = null,
  }) {
    return _then(_value.copyWith(
      diffPoints: null == diffPoints
          ? _value.diffPoints
          : diffPoints // ignore: cast_nullable_to_non_nullable
              as Map<TapPoint, bool>,
      animationController: freezed == animationController
          ? _value.animationController
          : animationController // ignore: cast_nullable_to_non_nullable
              as AnimationController?,
      levelType: freezed == levelType
          ? _value.levelType
          : levelType // ignore: cast_nullable_to_non_nullable
              as LevelType?,
      wrongTouchingNum: null == wrongTouchingNum
          ? _value.wrongTouchingNum
          : wrongTouchingNum // ignore: cast_nullable_to_non_nullable
              as int,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Result,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext?,
      isAngry: null == isAngry
          ? _value.isAngry
          : isAngry // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$$_GameStateCopyWith(
          _$_GameState value, $Res Function(_$_GameState) then) =
      __$$_GameStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<TapPoint, bool> diffPoints,
      AnimationController? animationController,
      LevelType? levelType,
      int wrongTouchingNum,
      Result result,
      BuildContext? context,
      bool isAngry});
}

/// @nodoc
class __$$_GameStateCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$_GameState>
    implements _$$_GameStateCopyWith<$Res> {
  __$$_GameStateCopyWithImpl(
      _$_GameState _value, $Res Function(_$_GameState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diffPoints = null,
    Object? animationController = freezed,
    Object? levelType = freezed,
    Object? wrongTouchingNum = null,
    Object? result = null,
    Object? context = freezed,
    Object? isAngry = null,
  }) {
    return _then(_$_GameState(
      diffPoints: null == diffPoints
          ? _value._diffPoints
          : diffPoints // ignore: cast_nullable_to_non_nullable
              as Map<TapPoint, bool>,
      animationController: freezed == animationController
          ? _value.animationController
          : animationController // ignore: cast_nullable_to_non_nullable
              as AnimationController?,
      levelType: freezed == levelType
          ? _value.levelType
          : levelType // ignore: cast_nullable_to_non_nullable
              as LevelType?,
      wrongTouchingNum: null == wrongTouchingNum
          ? _value.wrongTouchingNum
          : wrongTouchingNum // ignore: cast_nullable_to_non_nullable
              as int,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Result,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext?,
      isAngry: null == isAngry
          ? _value.isAngry
          : isAngry // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_GameState extends _GameState {
  const _$_GameState(
      {required final Map<TapPoint, bool> diffPoints,
      this.animationController,
      this.levelType,
      required this.wrongTouchingNum,
      required this.result,
      this.context,
      required this.isAngry})
      : _diffPoints = diffPoints,
        super._();

  final Map<TapPoint, bool> _diffPoints;
  @override
  Map<TapPoint, bool> get diffPoints {
    if (_diffPoints is EqualUnmodifiableMapView) return _diffPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_diffPoints);
  }

  @override
  final AnimationController? animationController;
  @override
  final LevelType? levelType;
  @override
  final int wrongTouchingNum;
  @override
  final Result result;
  @override
  final BuildContext? context;
  @override
  final bool isAngry;

  @override
  String toString() {
    return 'GameState(diffPoints: $diffPoints, animationController: $animationController, levelType: $levelType, wrongTouchingNum: $wrongTouchingNum, result: $result, context: $context, isAngry: $isAngry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameState &&
            const DeepCollectionEquality()
                .equals(other._diffPoints, _diffPoints) &&
            (identical(other.animationController, animationController) ||
                other.animationController == animationController) &&
            (identical(other.levelType, levelType) ||
                other.levelType == levelType) &&
            (identical(other.wrongTouchingNum, wrongTouchingNum) ||
                other.wrongTouchingNum == wrongTouchingNum) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.isAngry, isAngry) || other.isAngry == isAngry));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_diffPoints),
      animationController,
      levelType,
      wrongTouchingNum,
      result,
      context,
      isAngry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameStateCopyWith<_$_GameState> get copyWith =>
      __$$_GameStateCopyWithImpl<_$_GameState>(this, _$identity);
}

abstract class _GameState extends GameState {
  const factory _GameState(
      {required final Map<TapPoint, bool> diffPoints,
      final AnimationController? animationController,
      final LevelType? levelType,
      required final int wrongTouchingNum,
      required final Result result,
      final BuildContext? context,
      required final bool isAngry}) = _$_GameState;
  const _GameState._() : super._();

  @override
  Map<TapPoint, bool> get diffPoints;
  @override
  AnimationController? get animationController;
  @override
  LevelType? get levelType;
  @override
  int get wrongTouchingNum;
  @override
  Result get result;
  @override
  BuildContext? get context;
  @override
  bool get isAngry;
  @override
  @JsonKey(ignore: true)
  _$$_GameStateCopyWith<_$_GameState> get copyWith =>
      throw _privateConstructorUsedError;
}
