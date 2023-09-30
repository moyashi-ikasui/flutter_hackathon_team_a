import 'package:hooks_riverpod/hooks_riverpod.dart';

final levelProvider = StateProvider<LevelType>((ref) => LevelType.easy);

enum LevelType {
  easy,
  hard,
}

extension LevelTypeExt on LevelType {
  String get name {
    switch (this) {
      case LevelType.easy:
        return 'やさしい';
      case LevelType.hard:
        return '難しい';
    }
  }
}
