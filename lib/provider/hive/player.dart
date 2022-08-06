import 'package:hive_flutter/adapters.dart';

import '/domain/model/player.dart';
import 'base.dart';

/// [Hive] storage for a [Player].
class PlayerHiveProvider extends HiveBaseProvider<Player> {
  @override
  Stream<BoxEvent> get boxEvents => box.watch(key: 0);

  @override
  String get boxName => 'player';

  @override
  void registerAdapters() {
    Hive.maybeRegisterAdapter(PlayerAdapter());
    Hive.maybeRegisterAdapter(PlayerIdAdapter());
    Hive.maybeRegisterAdapter(PlayerNameAdapter());
  }

  /// Returns the stored [Player] from the [Hive].
  Player? get() => getSafe(0);

  /// Stores the provided [Player] to the [Hive].
  Future<void> set(Player player) => putSafe(0, player);
}
