import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  static const String routeName = '/filter';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const FilterScreen(),
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
