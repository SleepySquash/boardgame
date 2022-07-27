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
    return AspectRatio(
      aspectRatio: 70 / 100,
      child: Material(
        color: isUp ? Colors.grey : Colors.lightBlue,
        borderRadius: BorderRadius.circular(10),
        type: MaterialType.card,
        child: InkWell(
          onTap: onTap,
          child: isUp ? null : Center(child: Text(card?.asset ?? 'Card')),
        ),
      ),
    );
  }
}
