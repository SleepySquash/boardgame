import 'package:boardgame/ui/page/home/page/main/page/play/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/router.dart';
import '/util/platform_utils.dart';
import 'controller.dart';
import 'page/deck/view.dart';
import 'page/profile/view.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MainController(),
      builder: (MainController c) {
        return Scaffold(
          body: Row(
            children: [
              if (!context.isMobile)
                Obx(() {
                  int selected = 0;
                  switch (c.selected.value) {
                    case MainTab.deck:
                      selected = 1;
                      break;

                    case MainTab.play:
                      selected = 0;
                      break;

                    case MainTab.profile:
                      selected = 2;
                      break;
                  }

                  return NavigationRail(
                    selectedIndex: selected,
                    onDestinationSelected: (i) {
                      switch (i) {
                        case 0:
                          c.selected.value = MainTab.play;
                          break;

                        case 1:
                          c.selected.value = MainTab.deck;
                          break;

                        case 2:
                          c.selected.value = MainTab.profile;
                          break;
                      }
                    },
                    labelType: NavigationRailLabelType.selected,
                    destinations: const [
                      NavigationRailDestination(
                        selectedIcon: Icon(Icons.gamepad),
                        icon: Icon(Icons.gamepad_outlined),
                        label: Text('Game'),
                      ),
                      NavigationRailDestination(
                        selectedIcon: Icon(Icons.sim_card),
                        icon: Icon(Icons.sim_card_outlined),
                        label: Text('Deck'),
                      ),
                      NavigationRailDestination(
                        selectedIcon: Icon(Icons.person),
                        icon: Icon(Icons.person_outline),
                        label: Text('Profile'),
                      ),
                    ],
                  );
                }),
              Expanded(
                child: Obx(() {
                  return AnimatedSwitcher(
                    duration: 300.milliseconds,
                    child: KeyedSubtree(
                      key: Key(c.selected.value.name),
                      child: _page(c),
                    ),
                  );
                }),
              ),
            ],
          ),
          bottomNavigationBar: context.isMobile
              ? Obx(() {
                  int selected = 0;
                  switch (c.selected.value) {
                    case MainTab.deck:
                      selected = 0;
                      break;

                    case MainTab.play:
                      selected = 1;
                      break;

                    case MainTab.profile:
                      selected = 2;
                      break;
                  }

                  return NavigationBar(
                    labelBehavior:
                        NavigationDestinationLabelBehavior.onlyShowSelected,
                    backgroundColor: Colors.white,
                    selectedIndex: selected,
                    onDestinationSelected: (i) {
                      switch (i) {
                        case 0:
                          c.selected.value = MainTab.deck;
                          break;

                        case 1:
                          c.selected.value = MainTab.play;
                          break;

                        case 2:
                          c.selected.value = MainTab.profile;
                          break;
                      }
                    },
                    destinations: const [
                      NavigationDestination(
                        selectedIcon: Icon(Icons.sim_card),
                        icon: Icon(Icons.sim_card_outlined),
                        label: 'Deck',
                      ),
                      NavigationDestination(
                        selectedIcon: Icon(Icons.gamepad),
                        icon: Icon(Icons.gamepad_outlined),
                        label: 'Game',
                      ),
                      NavigationDestination(
                        selectedIcon: Icon(Icons.person),
                        icon: Icon(Icons.person_outline),
                        label: 'Profile',
                      ),
                    ],
                  );
                })
              : null,
        );
      },
    );
  }

  Widget _page(MainController c) {
    return Obx(() {
      switch (c.selected.value) {
        case MainTab.play:
          return const PlayView();

        case MainTab.deck:
          return const DeckView();

        case MainTab.profile:
          return const ProfileView();

        default:
          return Container();
      }
    });
  }
}
