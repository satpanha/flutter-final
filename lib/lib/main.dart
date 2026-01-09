import 'package:flutter/material.dart';

import 'models/comment.dart';
import 'models/restaurant.dart';
import 'models/restaurant_type.dart';
import 'ui/screens/restaurants_view.dart';
import 'ui/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: AppColors.main,
      debugShowCheckedModeBanner: false,
      home: RestaurantsView(restaurants: allRestaurants),
    );
  }

  List<Restaurant> get allRestaurants {
    List<Restaurant> result = [
      Restaurant(
        name: 'Flutter Burger',
        address: 'Street 174, Phnom Penh',
        type: RestaurantType.khmer,
        comments: [
          Comment(rating: 4, feedback: 'Tasty'),
          Comment(rating: 4, feedback: 'Good'),
          Comment(rating: 4, feedback: 'Nice'),
          Comment(rating: 4, feedback: 'Decent'),
          Comment(rating: 5, feedback: 'Excellent'),
        ],
      ),
      
      Restaurant(
        name: 'Les croissants de Ronan',
        address: 'Sisowath Quay, Phnom Penh',
        type: RestaurantType.french,
        comments: [
          Comment(rating: 4, feedback: 'Fresh'),
          Comment(rating: 3, feedback: 'Okay'),
        ],
      ),
      
      Restaurant(
        name: 'La Pizza Del Ronano (the best)',
        address: 'BKK1, Phnom Penh',
        type: RestaurantType.italian,
        comments: [
          Comment(rating: 5, feedback: 'Perfect'),
          Comment(rating: 4, feedback: 'Good'),
        ],
      ),
      
      Restaurant(
        name: 'Final Tacos',
        address: 'Street Exam, Phnom Penh',
        type: RestaurantType.mexican,
        comments: [
          Comment(rating: 3, feedback: 'Spicy'),
          Comment(rating: 4, feedback: 'Nice'),
        ],
      ),
      Restaurant(
        name: 'No money no Rice',
        address: 'BKK1, Phnom Penh',
        type: RestaurantType.streetfood,
        comments: [
          Comment(rating: 4, feedback: 'Cheap and good'),
        ],
      ),

       Restaurant(
        name: 'Ronano the Besto',
        address: 'CADT, Phnom Penh',
        type: RestaurantType.khmer,
        comments: [
          Comment(rating: 5, feedback: 'Amazing'),
          Comment(rating: 5, feedback: 'Top'),
        ],
      ),
       
    ];
    return result;
  }
}
