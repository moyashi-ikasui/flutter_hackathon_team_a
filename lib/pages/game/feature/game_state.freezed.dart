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
      AnimationController? animationController});
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
      AnimationController? animationController});
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
    ));
  }
}

/// @nodoc

class _$_GameState extends _GameState {
  const _$_GameState(
      {required final Map<TapPoint, bool> diffPoints, this.animationController})
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
  String toString() {
    return 'GameState(diffPoints: $diffPoints, animationController: $animationController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameState &&
            const DeepCollectionEquality()
                .equals(other._diffPoints, _diffPoints) &&
            (identical(other.animationController, animationController) ||
                other.animationController == animationController));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_diffPoints), animationController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameStateCopyWith<_$_GameState> get copyWith =>
      __$$_GameStateCopyWithImpl<_$_GameState>(this, _$identity);
}

abstract class _GameState extends GameState {
  const factory _GameState(
      {required final Map<TapPoint, bool> diffPoints,
      final AnimationController? animationController}) = _$_GameState;
  const _GameState._() : super._();

  @override
  Map<TapPoint, bool> get diffPoints;
  @override
  AnimationController? get animationController;
  @override
  @JsonKey(ignore: true)
  _$$_GameStateCopyWith<_$_GameState> get copyWith =>
      throw _privateConstructorUsedError;
}
