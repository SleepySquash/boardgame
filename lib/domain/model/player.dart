import 'package:hive/hive.dart';

import '../model_type_id.dart';

part 'player.g.dart';

@HiveType(typeId: ModelTypeId.player)
class Player {
  const Player(this.name);

  @HiveField(0)
  final String name;
}
