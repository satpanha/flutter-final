import 'package:flutter/material.dart';

import 'package:last_quiz_w12/models/restaurant.dart';
import 'package:last_quiz_w12/ui/widgets/comments/comment_tile.dart';
import 'package:last_quiz_w12/ui/screens/restaurant_comments_form.dart';
import 'package:last_quiz_w12/ui/widgets/chip/stars_chip.dart';
import 'package:last_quiz_w12/ui/widgets/chip/restaurant_type_chip.dart';
import 'package:last_quiz_w12/ui/theme.dart';

class RestaurantDetail extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantDetail({super.key, required this.restaurant});

  @override
  State<RestaurantDetail> createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  void _openAddComment() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: AddCommentForm(
            onSubmit: (c) {
              setState(() {
                widget.restaurant.comments.add(c);
              });
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final r = widget.restaurant;
    return Scaffold(
      appBar: AppBar(title: Text(r.name), backgroundColor: AppColors.main),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddComment,
        child: const Icon(Icons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            r.name,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              StarsChip(rating: r.averageRating),
              const SizedBox(width: 8),
              RestaurantTypeChip(type: r.type),
            ],
          ),
          const SizedBox(height: 16),
          Text('Address', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 6),
          Text(r.address),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 8),
          const Text('Comments', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          if (r.comments.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(child: Text('No comments yet')),
            )
          else
            ...r.comments.map((c) => CommentTile(comment: c)),
        ],
      ),
    );
  }
}
