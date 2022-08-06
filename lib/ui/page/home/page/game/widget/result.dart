import 'package:flutter/material.dart';

import '/router.dart';

class ResultModal extends StatelessWidget {
  const ResultModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const Text('You won!'),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            router.home();
          },
          child: const Text('Home'),
        ),
      ],
    );
  }
}
