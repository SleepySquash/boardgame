import 'card.dart';

mixin Equipable on Treasure {
  int get bonus;
  bool get isBig;
}

mixin Head on Equipable {}
mixin Torso on Equipable {}
mixin Shoes on Equipable {}
mixin Hand on Equipable {
  bool get twoHand;
}
