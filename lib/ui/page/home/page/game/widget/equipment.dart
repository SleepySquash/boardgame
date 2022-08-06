import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/domain/model/character.dart';

class EquipmentModal extends StatelessWidget {
  const EquipmentModal(this.character, {Key? key}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView(
        shrinkWrap: true,
        children: [
          Text('Level: ${character.level.value}'),
          ...character.races.map((e) => Text(e.name)),
          ...character.classes.map((e) => Text(e.name)),
          ...character.equipped.map((e) => Text(e.name)),
        ],
      );
    });
  }
}
