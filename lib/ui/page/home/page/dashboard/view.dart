import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/util/platform_utils.dart';
import 'controller.dart';
import 'page/deck/view.dart';
import 'page/play/view.dart';
import 'page/profile/view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DashboardController(),
      builder: (DashboardController c) {
        int _selectedIndex(MainTab value) {
          switch (value) {
            case MainTab.deck:
              return context.isMobile ? 0 : 1;

            case MainTab.play:
              return context.isMobile ? 1 : 0;

            case MainTab.profile:
              return context.isMobile ? 2 : 2;
          }
        }

        void _destinationSelected(int i) {
          switch (i) {
            case 0:
              c.selected.value = context.isMobile ? MainTab.deck : MainTab.play;
              break;

            case 1:
              c.selected.value = context.isMobile ? MainTab.play : MainTab.deck;
              break;

            case 2:
              c.selected.value =
                  context.isMobile ? MainTab.profile : MainTab.profile;
              break;
          }
        }

        return Scaffold(
          body: Row(
            children: [
              if (!context.isMobile)
                Obx(() {
                  return NavigationRail(
                    selectedIndex: _selectedIndex(c.selected.value),
                    onDestinationSelected: _destinationSelected,
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
                  return NavigationBar(
                    labelBehavior:
                        NavigationDestinationLabelBehavior.onlyShowSelected,
                    backgroundColor: Colors.white,
                    selectedIndex: _selectedIndex(c.selected.value),
                    onDestinationSelected: _destinationSelected,
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

  Widget _page(DashboardController c) {
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
