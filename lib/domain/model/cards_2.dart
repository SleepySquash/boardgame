enum CardType {
  door,
  treasure,
}

class Card {
  Card._({required this.type});

  factory Card.enemy({
    required String name,
    int level = 1,
  }) =>
      Card._(type: CardType.door);

  final CardType type;
}

class DeckDLC {
  static List<Card> get cards => [
        Card.enemy(name: 'Кикимора', level: 2),
      ];
}
