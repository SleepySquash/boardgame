import 'package:boardgame/domain/service/player.dart';
import 'package:boardgame/router.dart';
import 'package:boardgame/ui/page/home/page/game/widget/result.dart';
import 'package:boardgame/ui/widget/modal_popup.dart';
import 'package:boardgame/util/message_popup.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';

import '/domain/model/card.dart';
import '/domain/model/character.dart';
import '/domain/model/deck/deck.dart';
import '/domain/model/deck/standard/deck.dart';
import '/domain/model/player.dart';

enum RoundStage {
  start,
  battle,
  door,
  treasure,
  end,
}

class GameController extends GetxController {
  GameController(this._playerService);

  final Character character = Character();

  late final Deck deck;

  final Rx<PlayerId?> turn = Rx(null);
  final Rx<RoundStage?> stage = Rx(null);

  final int winLevel = 10;
  int treasuresToTake = 1;

  final RxList<Card> top = RxList();
  final RxList<Card> bottom = RxList();

  final PlayerService _playerService;

  Rx<Player?> get player => _playerService.player;

  @override
  void onInit() {
    deck = Deck(
      curses: StandardDeck.curses,
      enemies: StandardDeck.enemies,
      bonuses: StandardDeck.bonuses,
      classes: StandardDeck.classes,
      races: StandardDeck.races,
      levels: StandardDeck.levels,
      equipable: StandardDeck.equipable,
    );

    character.hand.value = [
      ...deck.doors.sample(4),
      ...deck.treasures.sample(4),
    ];

    stage.value = RoundStage.start;
    turn.value = player.value!.id;

    super.onInit();
  }

  void openDoor() {
    if (character.hand.length > 5) {
      MessagePopup.success('No more that 5 cards must be in your hand');
      return;
    }

    Card card = deck.doors.sample(1).first;
    top.add(card);

    if (card is Enemy) {
      stage.value = RoundStage.battle;
    } else {
      stage.value = RoundStage.door;
    }
  }

  void winBattle() {
    int myPower = character.level.value;
    for (var e in character.equipped) {
      myPower += e.bonus;
    }
    for (var e in bottom) {
      if (e is Bonus) {
        myPower += e.bonus;
      }
    }

    int enemyPower = 0;
    for (var e in top) {
      if (e is Enemy) {
        enemyPower += e.level;
      } else if (e is Bonus) {
        enemyPower += e.bonus;
      }
    }

    if (myPower > enemyPower) {
      int treasures = 0;
      int levels = 0;

      for (var e in top) {
        if (e is Enemy) {
          levels += e.levels;
          treasures += e.treasures;
        }
      }

      character.level.value += levels;
      treasuresToTake = treasures;

      top.clear();
      bottom.clear();

      if (character.level.value >= winLevel) {
        stage.value = RoundStage.end;
        turn.value = null;
        _playerService.addExperience(100);
        ModalPopup.show(context: router.context!, child: const ResultModal());
      } else {
        stage.value = RoundStage.treasure;
      }
    }
  }

  void runAway() {
    top.clear();
    bottom.clear();
    stage.value = RoundStage.end;
  }

  void endTurn() {
    if (character.hand.length > 5) {
      MessagePopup.success('No more that 5 cards must be in your hand');
      return;
    }

    stage.value = RoundStage.start;
  }

  void spawnTreasures() {
    top.value = deck.treasures.sample(treasuresToTake);
    stage.value = RoundStage.end;
  }

  void takeTreasure([int amount = 1]) {
    List<Card> cards = deck.treasures.sample(amount);
    character.hand.addAll(cards);
  }

  void equip(Card card) {
    bool equipped = false;

    if (card is Equipable) {
      if (card is Class) {
        if (character.classes.isNotEmpty) {
          MessagePopup.success('Only one class may be equipped');
          return;
        }

        equipped = true;
        character.classes.add(card);
      } else if (card is Race) {
        if (character.races.isNotEmpty) {
          MessagePopup.success('Only one race may be equipped');
          return;
        }

        equipped = true;
        character.races.add(card);
      } else {
        if (card is Head) {
          if (character.equipped.whereType<Head>().isNotEmpty) {
            MessagePopup.success('Only one head may be equipped');
            return;
          }
        } else if (card is Torso) {
          if (character.equipped.whereType<Torso>().isNotEmpty) {
            MessagePopup.success('Only one torso may be equipped');
            return;
          }
        } else if (card is Shoes) {
          if (character.equipped.whereType<Shoes>().isNotEmpty) {
            MessagePopup.success('Only one shoes may be equipped');
            return;
          }
        }

        character.equipped.add(card);
        equipped = true;
      }
    } else if (card is LevelAddition) {
      character.level.value += 1;
      equipped = true;
    }

    if (equipped) {
      top.remove(card);
      character.hand.remove(card);

      if (top.isEmpty) {
        if (stage.value == RoundStage.door) {
          stage.value = RoundStage.end;
        }
      }
    }
  }

  void addToTop(Card card) {
    if (card is LevelAddition) {
      character.hand.remove(card);
      character.level.value += 1;
    } else {
      switch (stage.value) {
        case RoundStage.battle:
          if (card is Bonus) {
            top.add(card);
            character.hand.remove(card);
          }
          break;

        case RoundStage.start:
        case RoundStage.door:
        case RoundStage.treasure:
        case RoundStage.end:
        default:
          // No-op.
          break;
      }
    }
  }

  void addToBottom(Card card) {
    if (card is LevelAddition) {
      character.hand.remove(card);
      character.level.value += 1;
    } else {
      switch (stage.value) {
        case RoundStage.battle:
          if (card is Bonus) {
            bottom.add(card);
            character.hand.remove(card);
          }
          break;

        case RoundStage.start:
        case RoundStage.door:
        case RoundStage.treasure:
        case RoundStage.end:
        default:
          // No-op.
          break;
      }
    }
  }
}
