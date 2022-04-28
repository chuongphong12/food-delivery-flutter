import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);

  static const String routeName = '/basket';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const BasketScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
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
              child: const Text('Go To Checkout'),
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
              'Cutlery',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Do you need a cutlery',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Switch.adaptive(
                    value: false,
                    onChanged: (bool? newValue) {},
                  )
                ],
              ),
            ),
            Text(
              'Items',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '1x',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          'Do you need a cutlery',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Text(
                        '\$10',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/delivery_time.svg'),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Delivery in 20 minutes',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Change',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/delivery_time.svg'),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Do you have a voucher?',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          'Apply',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                      )
                    ],
                  )
                ].reversed.toList(),
              ),
            ),
            const SizedBox(height: 10),
            Container(
                width: double.infinity,
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sub total',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          '\$10',
                          style: Theme.of(context).textTheme.headline6!,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery fee',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          '\$10',
                          style: Theme.of(context).textTheme.headline6!,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                        Text(
                          '\$20',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
