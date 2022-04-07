import 'package:flutter/material.dart';

class DeliveryTimeScreen extends StatelessWidget {
  const DeliveryTimeScreen({Key? key}) : super(key: key);

  static const String routeName = '/delivery_time';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const DeliveryTimeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basket')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Location Screen'),
          onPressed: () {},
        ),
      ),
    );
  }
}
