import '/domain/model/card.dart';

class Deck {
  const Deck({
    this.curses = const [],
    this.enemies = const [],
    this.bonuses = const [],
    this.classes = const [],
    this.races = const [],
    this.levels = const [],
    this.equipable = const [],
  });

  final List<Curse> curses;

  final List<Enemy> enemies;

  final List<Bonus> bonuses;

  final List<Class> classes;

  final List<Race> races;

  final List<LevelUp> levels;

  final List<Equipable> equipable;

  List<Card> get doors => [
        ...curses,
        ...enemies,
        ...bonuses,
        ...classes,
        ...races,
      ];

  List<Card> get treasures => [
        ...equipable,
        ...levels,
      ];
}
