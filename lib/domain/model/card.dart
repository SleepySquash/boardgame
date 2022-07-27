class Card {
  String? asset;
}

mixin Door on Card {}
mixin Enemy on Door {}
mixin Curse on Door {}
mixin Race on Door {}
mixin Class on Door {}

mixin Treasure on Card {}
