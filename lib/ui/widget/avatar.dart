import 'package:flutter/material.dart';

import '/domain/model/avatar.dart';

/// Widget to build an [Avatar].
///
/// Displays a colored [BoxDecoration] with initials based on a [title] if
/// [avatar] is not specified.
class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key? key,
    this.avatar,
    this.title,
    this.color,
    this.size = 40,
  }) : super(key: key);

  final Avatar? avatar;

  /// Optional title of an avatar to display.
  final String? title;

  /// Integer that determining the gradient color of the avatar.
  final int? color;

  final double size;

  /// Avatar color swatches.
  static const List<Color> colors = [
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.lightGreen,
    Colors.lime,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
  ];

  @override
  Widget build(BuildContext context) {
    Color gradient;

    if (color != null) {
      gradient = AvatarWidget.colors[color! % AvatarWidget.colors.length];
    } else if (title != null) {
      gradient =
          AvatarWidget.colors[(title!.hashCode) % AvatarWidget.colors.length];
    } else {
      gradient = const Color(0xFF555555);
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [gradient.lighten(), gradient],
        ),
        image: avatar == null
            ? null
            : DecorationImage(
                image: NetworkImage('${avatar?.url}'),
                fit: BoxFit.cover,
              ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: avatar == null
          ? LayoutBuilder(builder: (context, constraints) {
              return Center(
                child: Text(
                  (title ?? '??').initials(),
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              );
            })
          : null,
    );
  }
}

/// Extension adding an ability to get initials from a [String].
extension _InitialsExtension on String {
  /// Returns initials (two letters which begin each word) of this string.
  String initials() {
    List<String> words = split(' ').where((e) => e.isNotEmpty).toList();

    if (words.length >= 3) {
      return '${words[0][0]}${words[1][0]}${words[2][0]}'.toUpperCase();
    } else if (words.length >= 2) {
      return '${words[0][0]}${words[1][0]}'.toUpperCase();
    } else if (words.isNotEmpty) {
      if (words[0].length >= 2) {
        return '${words[0][0].toUpperCase()}${words[0][1].toLowerCase()}';
      } else {
        return words[0].toUpperCase();
      }
    }

    return '';
  }
}

/// Extension adding an ability to get a sum of [String] code units.
extension _SumStringExtension on String {
  /// Returns a sum of [codeUnits].
  int sum() => codeUnits.fold(0, (a, b) => a + b);
}

/// Extension adding an ability to lighten a color.
extension _LightenColorExtension on Color {
  /// Returns a lighten variant of this color.
  Color lighten([double amount = .2]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
