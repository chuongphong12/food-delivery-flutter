import 'package:flutter/material.dart';
import 'package:food_delivery_app_flutter/models/delivery_time_model.dart';

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
      appBar: AppBar(title: const Text('Delivery Time')),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                shape: const RoundedRectangleBorder(),
                padding: const EdgeInsets.symmetric(horizontal: 50),
              ),
              onPressed: () {},
              child: const Text('Select'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose a Date',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Delivery is today'),
                        duration: Duration(seconds: 2),
                      ));
                    },
                    child: const Text('Today'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Delivery is tomorrow'),
                        duration: Duration(seconds: 2),
                      ));
                    },
                    child: const Text('Tomorrow'),
                  ),
                ],
              ),
            ),
            Text(
              'Choose the time',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 2.5),
                    itemCount: DeliveryTime.deliveryTimes.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            DeliveryTime.deliveryTimes[index].value,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
