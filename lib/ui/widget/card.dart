import 'package:flutter/material.dart' hide Card;

import '/domain/model/card.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    this.card,
    this.isUp = false,
    this.onTap,
  }) : super(key: key);

  final Card? card;
  final bool isUp;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Widget _content() {
      String title = card?.name ?? '...';
      String? subtitle;
      String? under;

      if (card is Head) {
        under = 'Head';
      } else if (card is Torso) {
        under = 'Torso';
      } else if (card is Shoes) {
        under = 'Shoes';
      }

      if (card is Enemy) {
        var e = card as Enemy;
        subtitle = '${e.level}';
      }

      return Column(
        children: [
          Text(title),
          if (subtitle != null) Text(subtitle),
          if (card?.asset != null)
            Flexible(
              child: Image.asset(
                'assets/card/${card!.asset}',
                fit: BoxFit.contain,
              ),
            ),
          Expanded(
            child: card?.description != null
                ? Text(card!.description!)
                : Container(),
          ),
          if (under != null) Text(under),
        ],
      );
    }

    return AspectRatio(
      aspectRatio: 70 / 100,
      child: Material(
        elevation: 8,
        color: isUp ? Colors.grey : Colors.lightBlue,
        borderRadius: BorderRadius.circular(10),
        type: MaterialType.card,
        child: InkWell(
          onTap: onTap,
          child: isUp ? null : _content(),
        ),
      ),
    );
  }
}
