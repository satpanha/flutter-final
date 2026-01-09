import 'package:flutter/material.dart';

import 'package:last_quiz_w12/models/restaurant_type.dart';

class RestaurantTypeChip extends StatelessWidget {
  final RestaurantType type;
  const RestaurantTypeChip({super.key, required this.type});

  String get _label {
    final name = type.name;
    return name[0].toUpperCase() + name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    final textColor = type.color.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;

    return Chip(
      backgroundColor: type.color,
      label: Text(_label, style: TextStyle(color: textColor)),
    );
  }
}
