import 'restaurant_type.dart';
import 'comment.dart';

class Restaurant {
  final String name;
  final String address;
  final RestaurantType type;
  final List<Comment> comments;

  Restaurant({required this.name, required this.address, required this.type, List<Comment>? comments}) : comments = comments ?? [];

  double get averageRating {
    if (comments.isEmpty) return 0.0;
    final total = comments.fold<int>(0, (s, c) => s + c.rating);
    return total / comments.length;
  }
}

