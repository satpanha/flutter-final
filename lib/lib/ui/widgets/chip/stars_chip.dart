import 'package:flutter/material.dart';

class StarsChip extends StatelessWidget {
  final double rating;
  const StarsChip({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      avatar: const Icon(Icons.star, size: 18, color: Colors.amber),
      label: Text(rating.toStringAsFixed(1)),
    );
  }
}
