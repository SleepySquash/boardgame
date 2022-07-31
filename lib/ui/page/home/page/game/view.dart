import 'package:badges/badges.dart';
import 'package:boardgame/ui/page/home/page/game/component/equipment.dart';
import 'package:boardgame/ui/widget/modal_popup.dart';
import 'package:collection/collection.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:get/get.dart';

import '/domain/model/card.dart';
import '/router.dart';
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
                  Expanded(child: Obx(() {
                    return Text(
                        'Stage: ${c.stage.value?.name} | Turn: ${c.turn.value?.name}');
                  })),
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
              Expanded(flex: 7, child: _top(c)),
              Expanded(flex: 5, child: _middle(c)),
              Expanded(flex: 6, child: _bottom(c)),
            ],
          ),
        );
      },
    );
  }

  Widget _top(GameController c) {
    return Row(
      children: [
        DragTarget<_FromHand>(
          onAccept: (d) {
            c.character.hand.remove(d.card);
          },
          builder: (context, candidates, rejected) {
            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Obx(() {
                        return _deck(
                          onPressed: c.turn.value == c.player &&
                                  c.stage.value == RoundStage.treasure
                              ? () {
                                  c.top.value = c.deck.treasures.sample(1);
                                  c.stage.value = RoundStage.end;
                                }
                              : null,
                          child: const Center(
                            child: Text(
                              'Сокровища',
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 2),
                    Flexible(
                      child: Obx(() {
                        return _deck(
                          onPressed: c.turn.value == c.player &&
                                  c.stage.value == RoundStage.start
                              ? c.openDoor
                              : null,
                          child: const Center(
                            child: Text(
                              'Двери',
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
                Positioned.fill(
                  child: AnimatedSwitcher(
                    duration: 200.milliseconds,
                    child: candidates.isEmpty
                        ? Container()
                        : DottedBorder(
                            padding: EdgeInsets.zero,
                            child: Container(
                              key: const Key('DropHere'),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                color: Colors.black.withOpacity(0.4),
                              ),
                              width: double.infinity,
                              height: double.infinity,
                              child: const Center(child: Text('Drop here')),
                            ),
                          ),
                  ),
                ),
              ],
            );
          },
        ),
        Expanded(child: Obx(() {
          if (c.stage.value == RoundStage.battle) {
            return DragTarget<_FromHand>(
              onWillAccept: (d) => d?.card is Bonus || d?.card is LevelUp,
              onAccept: (d) => c.addToTop(d.card),
              builder: (context, candidates, rejected) {
                return Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: c.top.map((e) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: CardWidget(card: e),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            );
          } else if (c.stage.value == RoundStage.door ||
              c.stage.value == RoundStage.treasure ||
              c.stage.value == RoundStage.end) {
            return Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: c.top
                      .map(
                        (e) => LayoutBuilder(builder: (context, constraints) {
                          var widget = SizedBox(
                            height: constraints.maxHeight,
                            child: CardWidget(card: e),
                          );

                          return Draggable(
                            data: _ToHand(e),
                            feedback: widget,
                            childWhenDragging: Container(),
                            child: widget,
                          );
                        }),
                      )
                      .toList(),
                ),
              ),
            );
          }

          return Container();
        })),
      ],
    );
  }

  Widget _middle(GameController c) {
    return Row(
      children: [
        Expanded(
            child: DragTarget<_FromHand>(
          onWillAccept: (d) =>
              (c.stage.value == RoundStage.battle && d?.card is Bonus) ||
              d?.card is LevelUp,
          onAccept: (d) => c.addToBottom(d.card),
          builder: (context, candidates, rejected) {
            return Obx(() {
              return Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: c.bottom.map((e) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(2, 8, 2, 8),
                        child: CardWidget(card: e),
                      );
                    }).toList(),
                  ),
                ),
              );
            });
          },
        )),
        Obx(() {
          switch (c.stage.value) {
            case RoundStage.start:
              break;

            case RoundStage.battle:
              int myPower = c.character.level.value;
              for (var e in c.character.equipped) {
                myPower += e.bonus;
              }
              for (var e in c.bottom) {
                if (e is Bonus) {
                  myPower += e.bonus;
                }
              }

              int enemyPower = 0;
              for (var e in c.top) {
                if (e is Enemy) {
                  enemyPower += e.level;
                } else if (e is Bonus) {
                  enemyPower += e.bonus;
                }
              }

              if (myPower > enemyPower) {
                return TextButton(
                  onPressed: c.winBattle,
                  child: const Text('Confirm win'),
                );
              } else {
                return TextButton(
                  onPressed: c.runAway,
                  child: const Text('Run away'),
                );
              }

            case RoundStage.door:
              break;

            case RoundStage.treasure:
              break;

            case RoundStage.end:
              return TextButton(
                onPressed: c.endTurn,
                child: const Text('End turn'),
              );

            default:
              // No-op.
              break;
          }

          return Container();
        }),

        // VS tabloid.
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Obx(() {
            int myPower = c.character.level.value;
            for (var e in c.character.equipped) {
              myPower += e.bonus;
            }
            for (var e in c.bottom) {
              if (e is Bonus) {
                myPower += e.bonus;
              }
            }

            int enemyPower = 0;
            for (var e in c.top) {
              if (e is Enemy) {
                enemyPower += e.level;
              } else if (e is Bonus) {
                enemyPower += e.bonus;
              }
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: enemyPower >= myPower
                          ? Colors.lightBlue
                          : Colors.lightBlue.withOpacity(0.4),
                    ),
                    child: Text('$enemyPower'),
                  ),
                ),
                const Text('vs'),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: enemyPower < myPower
                          ? Colors.lightBlue
                          : Colors.lightBlue.withOpacity(0.4),
                    ),
                    child: Text('$myPower'),
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }

  Widget _bottom(GameController c) {
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        children: [
          DragTarget<_DraggableCard>(
            onWillAccept: (d) => d?.card is Equipable || d?.card is LevelUp,
            onAccept: (d) => c.equip(d.card),
            builder: (context, candidates, rejected) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                child: Badge(
                  position: BadgePosition.topStart(start: -5),
                  badgeContent: Obx(() {
                    int power = c.character.level.value;
                    for (var e in c.character.equipped) {
                      power += e.bonus;
                    }

                    return Text('$power');
                  }),
                  child: Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () async {
                        await ModalPopup.show(
                          context: context,
                          child: EquipmentModal(c.character),
                        );
                      },
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: constraints.maxWidth / 4),
                        width: 180,
                        height: double.infinity,
                        child: Column(
                          children: [
                            const Text('Equipment'),
                            Obx(() {
                              return Text(
                                '${c.character.equipped.length} equipped',
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: DragTarget<_ToHand>(
              onAccept: (d) {
                c.top.remove(d.card);
                c.character.hand.add(d.card);

                if (c.top.isEmpty) {
                  if (c.stage.value == RoundStage.door) {
                    c.stage.value = RoundStage.end;
                  }
                }
              },
              builder: (context, candidates, rejected) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4, 0, 4),
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: c.character.hand.map((e) {
                            return Container(
                              padding: const EdgeInsets.fromLTRB(2, 8, 2, 8),
                              height: constraints.maxHeight - 16,
                              child: Draggable(
                                data: _FromHand(e),
                                feedback: SizedBox(
                                  height: constraints.maxHeight - 32,
                                  child: CardWidget(card: e),
                                ),
                                childWhenDragging: const Opacity(
                                  opacity: 0,
                                  child: CardWidget(isUp: true),
                                ),
                                child: CardWidget(card: e),
                              ),
                            );
                          }).toList(),
                        );
                      }),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
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
      color: onPressed == null
          ? Colors.lightBlue.withOpacity(0.4)
          : Colors.lightBlue,
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

class _DraggableCard {
  const _DraggableCard(this.card);
  final Card card;
}

class _ToHand extends _DraggableCard {
  const _ToHand(Card card) : super(card);
}

class _FromHand extends _DraggableCard {
  const _FromHand(Card card) : super(card);
}
