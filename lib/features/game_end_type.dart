enum GameEndType {
  finish,
  timeUp,
}

extension GameEndTypeEx on GameEndType {
  String get dialogMessage {
    switch (this) {
      case GameEndType.finish:
        return '全部見つけれた？';
      case GameEndType.timeUp:
        return '時間切れ！！';
    }
  }
}
