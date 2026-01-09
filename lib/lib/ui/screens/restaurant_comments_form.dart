import 'package:flutter/material.dart';

import 'package:last_quiz_w12/models/comment.dart';

class AddCommentForm extends StatefulWidget {
  final void Function(Comment) onSubmit;
  const AddCommentForm({super.key, required this.onSubmit});

  @override
  State<AddCommentForm> createState() => _AddCommentFormState();
}

class _AddCommentFormState extends State<AddCommentForm> {
  final _formKey = GlobalKey<FormState>();
  int _rating = 5;
  final _feedbackCtrl = TextEditingController();

  @override
  void dispose() {
    _feedbackCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final comment = Comment(
      rating: _rating,
      feedback: _feedbackCtrl.text.trim(),
    );
    widget.onSubmit(comment);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<int>(
              value: _rating,
              decoration: const InputDecoration(labelText: 'Rating (0-5)'),
              items: List.generate(6, (i) => i)
                  .map(
                    (n) =>
                        DropdownMenuItem(value: n, child: Text(n.toString())),
                  )
                  .toList(),
              onChanged: (v) => setState(() => _rating = v ?? 0),
            ),
            TextFormField(
              controller: _feedbackCtrl,
              decoration: const InputDecoration(labelText: 'Feedback'),
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? 'Enter your feedback'
                  : null,
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _submit, child: const Text('COMMENT')),
          ],
        ),
      ),
    );
  }
}
