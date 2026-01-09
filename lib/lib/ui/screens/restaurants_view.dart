import 'package:flutter/material.dart';

import 'package:last_quiz_w12/models/restaurant.dart';
import 'package:last_quiz_w12/models/restaurant_type.dart';
import 'package:last_quiz_w12/ui/widgets/chip/stars_chip.dart';
import 'package:last_quiz_w12/ui/widgets/chip/restaurant_type_chip.dart';
import 'package:last_quiz_w12/ui/theme.dart';
import 'restaurant_detail.dart';

class RestaurantsView extends StatefulWidget {
  const RestaurantsView({super.key, required this.restaurants});

  final List<Restaurant> restaurants;

  @override
  State<RestaurantsView> createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {
  bool _khmerOnly = false;

  List<Restaurant> get _filtered => _khmerOnly
      ? widget.restaurants.where((r) => r.type == RestaurantType.khmer).toList()
      : widget.restaurants;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: const Text('Miam'),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Checkbox(
                  value: _khmerOnly,
                  onChanged: (v) => setState(() => _khmerOnly = v ?? false),
                ),
                const SizedBox(width: 8),
                const Text('Khmer only'),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: _filtered.length,
              itemBuilder: (context, index) {
                final r = _filtered[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            r.name,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),

                        const SizedBox(width: 8),
                        StarsChip(rating: r.averageRating),
                        const SizedBox(width: 8),
                        RestaurantTypeChip(type: r.type),
                      ],
                    ),
                    subtitle: Text(r.address),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RestaurantDetail(restaurant: r),
                        ),
                      );
                      setState(() {});
                    },
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
