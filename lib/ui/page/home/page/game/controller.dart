import 'package:get/get.dart';

import '/domain/model/card.dart';
import '/domain/model/character.dart';
import '/domain/model/player.dart';

enum RoundStage {
  start,
  battle,
  door,
  end,
}

class GameController extends GetxController {
  final Character player = Character();

  final Rx<Player?> turn = Rx(null);
  final Rx<RoundStage?> stage = Rx(null);

  @override
  void onInit() {
    player.hand.value = [
      Card(),
      Card(),
      Card(),
      Card(),
      Card(),
    ];

    stage.value = RoundStage.start;

    super.onInit();
  }
}
