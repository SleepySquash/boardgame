import 'package:boardgame/domain/model/player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '/domain/service/auth.dart';
import '/router.dart';

class AuthController extends GetxController {
  AuthController(this._authService);

  final TextEditingController nameController = TextEditingController();

  final AuthService _authService;

  Rx<RxStatus> get status => _authService.status;

  Future<void> signIn() async {
    await _authService.signIn();
    router.home();
  }

  Future<void> register() async {
    if (nameController.text.isNotEmpty) {
      await _authService.register();
      router.home(
        player: Player(
          id: PlayerId(const Uuid().v4()),
          name: PlayerName(nameController.text),
        ),
      );
    }
  }
}
