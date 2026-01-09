import 'package:flutter/material.dart';

import 'package:last_quiz_w12/models/comment.dart';
import 'package:last_quiz_w12/ui/screens/restaurant_comments_view.dart';
import 'package:last_quiz_w12/ui/widgets/chip/stars_chip.dart';

class CommentTile extends StatelessWidget {
  final Comment comment;
  const CommentTile({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: StarsChip(rating: comment.rating.toDouble()),
      title: Text(comment.feedback),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CommentView(comment: comment)),
      ),
    );
  }
}
