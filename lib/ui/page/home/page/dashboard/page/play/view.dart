import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/router.dart';
import 'controller.dart';

class PlayView extends StatelessWidget {
  const PlayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PlayController(),
      builder: (PlayController c) {
        return Center(
          child: TextButton(
            onPressed: router.game,
            child: const Text('Play'),
          ),
        );
      },
    );
  }
}
