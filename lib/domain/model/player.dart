import 'package:hive/hive.dart';

import '../model_type_id.dart';
import '/util/new_type.dart';

part 'player.g.dart';

@HiveType(typeId: ModelTypeId.player)
class Player {
  Player({
    required this.id,
    required this.name,
    this.exp = 0,
  });

  @HiveField(0)
  final PlayerId id;

  @HiveField(1)
  final PlayerName name;

  @HiveField(2)
  int exp;
}

@HiveType(typeId: ModelTypeId.playerId)
class PlayerId extends NewType<String> {
  const PlayerId(String val) : super(val);
}

@HiveType(typeId: ModelTypeId.playerName)
class PlayerName extends NewType<String> {
  const PlayerName(String val) : super(val);
}
