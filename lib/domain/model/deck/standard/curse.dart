import '/domain/model/card.dart';

class LigmaBalls extends Card with Door, Curse {
  @override
  String get name => 'You\'ve got Ligma Balls';

  @override
  String? get asset => 'door/curse/ligma_balls.jpeg';
}
