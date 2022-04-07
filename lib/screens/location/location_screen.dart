import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app_flutter/blocs/autocomplete/autocomplete_bloc.dart';
import 'package:food_delivery_app_flutter/blocs/geolocation/geolocation_bloc.dart';
import 'package:food_delivery_app_flutter/blocs/place/place_bloc.dart';
import 'package:food_delivery_app_flutter/models/place_model.dart';
import 'package:food_delivery_app_flutter/widgets/widgets.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  static const String routeName = '/location';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const LocationScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    void _onPlaceSelected(Place place) {}

    return Scaffold(
      body: BlocBuilder<PlaceBloc, PlaceState>(
        builder: (context, state) {
          if (state is PlaceLoading) {
            return Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: BlocBuilder<GeolocationBloc, GeolocationState>(
                    builder: (context, state) {
                      if (state is GeolocationLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is GeolocationLoaded) {
                        return Gmap(
                          lat: state.position.latitude,
                          lng: state.position.longitude,
                        );
                      }
                      return const Center(child: Text('Something went wrong'));
                    },
                  ),
                ),
                const Positioned(
                  top: 40,
                  left: 20,
                  right: 20,
                  child: Location(),
                ),
                const SaveButton(),
              ],
            );
          }
          if (state is PlaceLoaded) {
            return Stack(
              children: [
                Gmap(
                  lat: state.place.lat,
                  lng: state.place.lon,
                ),
                const Positioned(
                  top: 40,
                  left: 20,
                  right: 20,
                  child: Location(),
                ),
                const SaveButton(),
              ],
            );
          }
          return const Center(
            child: Text('Something when wrong!'),
          );
        },
      ),
    );
  }
}

class Location extends StatelessWidget {
  const Location({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset('assets/logo.svg', height: 50),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            children: [
              const LocationSearchBox(),
              BlocBuilder<AutocompleteBloc, AutocompleteState>(
                builder: (context, state) {
                  if (state is AutocompleteLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is AutocompleteLoaded) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      height: 300,
                      color: state.places.isNotEmpty
                          ? Colors.black.withOpacity(0.6)
                          : Colors.transparent,
                      child: ListView.builder(
                        itemCount: state.places.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(
                            state.places[index].description,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          ),
                          onTap: () {
                            context
                                .read<PlaceBloc>()
                                .add(LoadedPlace(placeId: state.places[index].placeId));
                          },
                        ),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      left: 20,
      right: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
          ),
          child: const Text('Save'),
          onPressed: () {},
        ),
      ),
    );
  }
}
