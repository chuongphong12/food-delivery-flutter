import 'package:flutter/material.dart';
import 'package:food_delivery_app_flutter/models/models.dart';
import 'package:food_delivery_app_flutter/widgets/widgets.dart';

class RestaurantListingScreen extends StatelessWidget {
  final RestaurantListingArguments arguments;
  const RestaurantListingScreen({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  static const String routeName = '/restaurant';

  static Route route({required RestaurantListingArguments arguments}) {
    return MaterialPageRoute(
      builder: (context) => RestaurantListingScreen(
        arguments: arguments,
      ),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${arguments.category} Restaurants')),
      body: ListView.builder(
          itemCount: arguments.restaurants.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: RestaurantCard(restaurant: arguments.restaurants[index]),
            );
          }),
    );
  }
}
