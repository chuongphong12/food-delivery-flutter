import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app_flutter/blocs/autocomplete/autocomplete_bloc.dart';
import 'package:food_delivery_app_flutter/blocs/basket/basket_bloc.dart';
import 'package:food_delivery_app_flutter/blocs/filters/filters_bloc.dart';
import 'package:food_delivery_app_flutter/blocs/geolocation/geolocation_bloc.dart';
import 'package:food_delivery_app_flutter/blocs/place/place_bloc.dart';
import 'package:food_delivery_app_flutter/blocs/vouchers/vouchers_bloc.dart';
import 'package:food_delivery_app_flutter/configs/app_router.dart';
import 'package:food_delivery_app_flutter/configs/theme.dart';
import 'package:food_delivery_app_flutter/firebase_options.dart';
import 'package:food_delivery_app_flutter/repository/geolocation/geolocation_repository.dart';
import 'package:food_delivery_app_flutter/repository/places/places_repository.dart';
import 'package:food_delivery_app_flutter/repository/vouchers/vouchers_repository.dart';
import 'package:food_delivery_app_flutter/screens/screens.dart';
import 'package:food_delivery_app_flutter/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GeolocationRepository>(
          create: (context) => GeolocationRepository(),
        ),
        RepositoryProvider<PlacesRepository>(
          create: (context) => PlacesRepository(),
        ),
        RepositoryProvider<VouchersRepository>(
          create: (context) => VouchersRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<GeolocationBloc>(
            create: (context) => GeolocationBloc(
                geolocationRepository: context.read<GeolocationRepository>())
              ..add(LoadGeolocation()),
          ),
          BlocProvider<AutocompleteBloc>(
            create: (context) => AutocompleteBloc(
              placesRepository: context.read<PlacesRepository>(),
            )..add(const LoadAutocomplete()),
          ),
          BlocProvider<PlaceBloc>(
            create: (context) => PlaceBloc(
              placesRepository: context.read<PlacesRepository>(),
            ),
          ),
          BlocProvider(
            create: ((context) => VouchersBloc(
                vouchersRepository: context.read<VouchersRepository>())
              ..add(LoadVoucher())),
          ),
          BlocProvider(
            create: (context) => FiltersBloc()..add(FilterLoad()),
          ),
          BlocProvider(
            create: (context) =>
                BasketBloc(vouchersBloc: BlocProvider.of<VouchersBloc>(context))
                  ..add(StartBasket()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Food Delivery',
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomeScreen.routeName,
        ),
      ),
    );
  }
}
