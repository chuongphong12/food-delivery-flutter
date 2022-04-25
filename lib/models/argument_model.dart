import 'package:food_delivery_app_flutter/models/restaurant_model.dart';

class RestaurantListingArguments {
  final String category;
  final List<Restaurant> restaurants;

  RestaurantListingArguments(this.category, this.restaurants);
}
