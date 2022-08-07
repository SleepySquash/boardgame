import '/domain/model/card.dart';
import 'bonus.dart';
import 'class.dart';
import 'curse.dart';
import 'enemy.dart';
import 'equipable.dart';
import 'level.dart';
import 'race.dart';
import 'wanderer_beast.dart';

class StandardDeck {
  static List<Curse> get curses => [
        LigmaBalls(),
      ];

  static List<Enemy> get enemies => [
        TerribleMonkey(),
        NotTerribleMonkey(),
        Yor(),
        AngryYor(),
        Zombie(),
        ZombieWarrior(),
      ];

  static List<Bonus> get bonuses => [
        PlusTwo(),
        PlusFive(),
        PoisonBottle2(),
        PoisonBottle5(),
      ];

  static List<Class> get classes => [
        Warrior(),
        Wizard(),
        Thief(),
      ];

  static List<Race> get races => [
        Elf(),
        Dwarf(),
        Ork(),
      ];

  static List<LevelAddition> get levels => [
        GetLevel(),
      ];

  static List<EnemyAddition> get beasts => [
        WandererBeast(),
      ];

  static List<Equipable> get equipable => [
        WoodenHelmet(),
        WoodenArmor(),
        WoodenShoes(),
        IronSword(),
      ];
}
