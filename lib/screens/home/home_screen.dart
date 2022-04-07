import 'package:flutter/material.dart';

import 'package:food_delivery_app_flutter/models/category_model.dart';
import 'package:food_delivery_app_flutter/models/restaurant_model.dart';
import 'package:food_delivery_app_flutter/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: Category.categories.length,
                  itemBuilder: (context, index) {
                    return CategoryBox(
                      category: Category.categories[index],
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 125,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const PromoBox();
                  },
                ),
              ),
            ),
            const FoodSearchBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Top rated',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: Restaurant.restaurants.length,
              itemBuilder: (context, index) {
                return RestaurantBox(
                  restaurant: Restaurant.restaurants[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RestaurantBox extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantBox({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 60,
              height: 30,
              child: Text('${restaurant.deliveryTime} min'),
            )
          ],
        ),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.person),
        onPressed: () {},
      ),
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Location',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),
          ),
          Text(
            'Singapore, 1 Shenton Way',
            style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
