import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_delivery_app_flutter/blocs/filters/filters_bloc.dart';
import 'package:food_delivery_app_flutter/models/argument_model.dart';
import 'package:food_delivery_app_flutter/models/restaurant_model.dart';
import 'package:food_delivery_app_flutter/screens/screens.dart';
import 'package:food_delivery_app_flutter/widgets/custom_category_filter.dart';
import 'package:food_delivery_app_flutter/widgets/custom_price_filter.dart';

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
    void _applyFilter(FiltersLoaded state) {
      var categories = state.filter.categoryFilters
          .where((filter) => filter.value)
          .map((filter) => filter.category.name)
          .toList();
      var prices = state.filter.priceFilters
          .where((filter) => filter.value)
          .map((filter) => filter.price.price)
          .toList();

      List<Restaurant> restaurants = Restaurant.restaurants
          .where(
            (restaurant) => categories.any(
              (category) => restaurant.tags.contains(category),
            ),
          )
          .where(
            (restaurant) => prices.any(
              (price) => restaurant.priceCategory.contains(price),
            ),
          )
          .toList();
      Navigator.pushNamed(
        context,
        RestaurantListingScreen.routeName,
        arguments: RestaurantListingArguments('Filter', restaurants),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Filter')),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<FiltersBloc, FiltersState>(
              builder: (context, state) {
                if (state is FiltersLoading) {
                  return const Center(
                    child: SpinKitCubeGrid(
                      color: Colors.white,
                    ),
                  );
                }
                if (state is FiltersLoaded) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      shape: const RoundedRectangleBorder(),
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                    ),
                    onPressed: () => _applyFilter(state),
                    child: const Text('Apply'),
                  );
                } else {
                  return const Text('Something went wrong');
                }
              },
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
              'Price',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            const CustomPriceFilter(),
            Text(
              'Category',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            const CustomCategoryFilter(),
          ],
        ),
      ),
    );
  }
}
