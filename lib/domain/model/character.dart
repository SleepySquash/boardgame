import 'package:get/get.dart';

import 'card.dart';

class Character {
  final RxInt level = RxInt(1);
  final RxList<Equipable> equipped = RxList();
  final RxList<Card> hand = RxList();
  final RxList<Race> races = RxList();
  final RxList<Class> classes = RxList();

  int get power => level.value;
}
