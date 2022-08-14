import 'package:boardgame/domain/model/player.dart';
import 'package:boardgame/domain/service/auth.dart';
import 'package:boardgame/domain/service/player.dart';
import 'package:boardgame/router.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  ProfileController(this._authService, this._playerService);

  final AuthService _authService;
  final PlayerService _playerService;

  Rx<Player?> get player => _playerService.player;

  void logout() {
    _authService.logout();
    router.auth();
  }
}
