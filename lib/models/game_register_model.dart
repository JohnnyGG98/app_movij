class GameRegisterModel {

  DateTime lastPlay;
  int totalWins;

  GameRegisterModel({
    this.lastPlay,
    this.totalWins = 0,
  });

  String get labelWins => '$totalWins Victoria${totalWins == 1 ? '' : 's'}';
  String get labelLastPlay {
    if (lastPlay == null) return 'dd-mm-yyyy hh:mm:ss';

    return '${lastPlay.day.toString().padLeft(2)}-${lastPlay.month.toString().padLeft(2)}-${lastPlay.year.toString()} ${lastPlay.hour.toString().padLeft(1)}:${lastPlay.minute.toString().padLeft(2)}:${lastPlay.second.toString().padLeft(2)}';
  }
}
