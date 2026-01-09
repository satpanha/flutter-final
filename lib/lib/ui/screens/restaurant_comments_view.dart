import 'package:flutter/material.dart';

import 'package:last_quiz_w12/models/comment.dart';
import 'package:last_quiz_w12/ui/widgets/chip/stars_chip.dart';
import 'package:last_quiz_w12/ui/theme.dart';

class CommentView extends StatelessWidget {
  final Comment comment;
  const CommentView({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comment'),
        backgroundColor: AppColors.main,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [StarsChip(rating: comment.rating.toDouble())]),
            const SizedBox(height: 16),
            const Text(
              'Feedback',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(comment.feedback),
          ],
        ),
      ),
    );
  }
}
