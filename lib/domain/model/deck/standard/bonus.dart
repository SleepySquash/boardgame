import '/domain/model/card.dart';

class PlusTwo extends Card with Door, Bonus {
  @override
  String get name => 'Smart move';

  @override
  String get description => 'Adds +2 to any side';

  @override
  int get bonus => 2;
}

class PlusFive extends Card with Door, Bonus {
  @override
  String get name => 'Very smart move';

  @override
  String get description => 'Adds +5 to any side';

  @override
  int get bonus => 5;
}

class PoisonBottle2 extends Card with Door, Bonus {
  @override
  String get name => 'Small Poison bottle';

  @override
  String get description => 'Adds -2 to any side';

  @override
  int get bonus => -2;
}

class PoisonBottle5 extends Card with Door, Bonus {
  @override
  String get name => 'Big Poison bottle';

  @override
  String get description => 'Adds -5 to any side';

  @override
  int get bonus => -5;
}
