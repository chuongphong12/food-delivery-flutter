import 'package:flutter/material.dart';
import 'package:food_delivery_app_flutter/models/models.dart';
import 'package:food_delivery_app_flutter/screens/screens.dart';

class CategoryBox extends StatelessWidget {
  final Category _category;
  const CategoryBox({
    Key? key,
    required Category category,
  })  : _category = category,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Restaurant> restaurants = Restaurant.restaurants
        .where(
          (restaurant) => restaurant.tags.contains(_category.name),
        )
        .toList();
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RestaurantListingScreen.routeName,
          arguments: RestaurantListingArguments(_category.name, restaurants),
        );
      },
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                height: 50,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: _category.image,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  _category.name,
                  style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
