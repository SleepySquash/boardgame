import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/router.dart';
import '/util/message_popup.dart';

import 'controller.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AuthController(Get.find()),
      builder: (AuthController c) {
        return Obx(() {
          if (c.status.value.isLoading) {
            return const Scaffold(body: CircularProgressIndicator());
          }

          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('BoardGame'),
                  const SizedBox(height: 20),
                  TextField(
                    controller: c.nameController,
                    decoration:
                        const InputDecoration(label: Text('Player name')),
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: c.register,
                    style: ElevatedButton.styleFrom(primary: Colors.lightBlue),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
