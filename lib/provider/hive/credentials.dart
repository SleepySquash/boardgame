import 'package:hive_flutter/adapters.dart';

import '/domain/model/credentials.dart';
import 'base.dart';

/// [Hive] storage for a [Credentials].
class CredentialsHiveProvider extends HiveBaseProvider<Credentials> {
  @override
  Stream<BoxEvent> get boxEvents => box.watch(key: 0);

  @override
  String get boxName => 'credentials';

  @override
  void registerAdapters() {
    Hive.maybeRegisterAdapter(CredentialsAdapter());
  }

  /// Returns the stored [Credentials] from the [Hive].
  Credentials? get() => getSafe(0);

  /// Stores the provided [Credentials] to the [Hive].
  Future<void> set(Credentials credentials) => putSafe(0, credentials);
}
