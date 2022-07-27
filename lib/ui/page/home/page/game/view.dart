import 'package:badges/badges.dart';
import 'package:boardgame/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/ui/widget/avatar.dart';
import '/ui/widget/button.dart';
import '/ui/widget/card.dart';
import 'controller.dart';

class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: GameController(),
      builder: (GameController c) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 72),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  WidgetButton(
                    onPressed: router.home,
                    child: const Icon(Icons.menu),
                  ),
                  const Spacer(),
                  WidgetButton(
                    onPressed: () {},
                    child: const AvatarWidget(title: '1'),
                  ),
                  const SizedBox(width: 4),
                  WidgetButton(
                    onPressed: () {},
                    child: const AvatarWidget(title: '2'),
                  ),
                  const SizedBox(width: 4),
                  WidgetButton(
                    onPressed: () {},
                    child: const AvatarWidget(title: '3'),
                  ),
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                flex: 7,
                child: Container(
                  color: Colors.green,
                  padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _deck(
                            onPressed: () {},
                            child: const Center(
                              child: Text(
                                'Сокровища',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                          ),
                          _deck(
                            onPressed: () {},
                            child: const Center(
                              child: Text(
                                'Двери',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.red,
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.lightBlue,
                              ),
                              child: const Text('1'),
                            ),
                            const Text('vs'),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.lightBlue,
                              ),
                              child: const Text('1'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: LayoutBuilder(builder: (context, constraints) {
                  return Container(
                    color: Colors.blue,
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Badge(
                          position: BadgePosition.topStart(),
                          badgeContent: const Text('5'),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: constraints.maxWidth / 4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey,
                            ),
                            width: 180,
                            height: double.infinity,
                            child: const Center(child: Text('Equipment')),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4, 4, 0, 4),
                            child: Center(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: constraints.maxHeight - 16,
                                      child: const CardWidget(),
                                    ),
                                    const SizedBox(width: 4),
                                    SizedBox(
                                      height: constraints.maxHeight - 16,
                                      child: const CardWidget(),
                                    ),
                                    const SizedBox(width: 4),
                                    SizedBox(
                                      height: constraints.maxHeight - 16,
                                      child: const CardWidget(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _deck({
    required Widget child,
    VoidCallback? onPressed,
  }) {
    return Material(
      elevation: 4,
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
      color: Colors.lightBlue,
      child: InkWell(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(8),
          width: 80,
          height: 100,
          child: child,
        ),
      ),
    );
  }
}
