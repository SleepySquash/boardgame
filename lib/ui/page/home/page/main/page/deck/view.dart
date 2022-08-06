import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class DeckView extends StatelessWidget {
  const DeckView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DeckController(),
      builder: (DeckController c) {
        return Container();
      },
    );
  }
}
