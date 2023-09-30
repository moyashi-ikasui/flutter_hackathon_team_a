enum GameEndType {
  finish,
  timeUp,
}

extension GameEndTypeEx on GameEndType {
  String get dialogMessage {
    switch (this) {
      case GameEndType.finish:
        return 'これでOK？';
      case GameEndType.timeUp:
        return '時間ぎれ！';
    }
  }
}
