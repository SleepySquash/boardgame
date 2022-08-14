import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileController(Get.find(), Get.find()),
      builder: (ProfileController c) {
        return Column(
          children: [
            Row(
              children: [
                const Expanded(child: Center(child: Text('Profile'))),
                IconButton(onPressed: c.logout, icon: const Icon(Icons.logout))
              ],
            ),
            Expanded(
                child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(() => Text('ID: ${c.player.value?.id}')),
                  Obx(() => Text('Name: ${c.player.value?.name}')),
                  Obx(() => Text('EXP: ${c.player.value?.exp}')),
                ],
              ),
            )),
          ],
        );
      },
    );
  }
}
