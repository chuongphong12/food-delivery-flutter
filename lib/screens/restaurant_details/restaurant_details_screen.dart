import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({Key? key}) : super(key: key);

  static const String routeName = '/restaurant-details';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const RestaurantDetailScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Restaurant Details')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Location Screen'),
          onPressed: () {},
        ),
      ),
    );
  }
}
