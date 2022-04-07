import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app_flutter/repository/geolocation/geolocation_repository.dart';
import 'package:geolocator/geolocator.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GeolocationRepository _geolocationRepository;
  StreamSubscription? _geolocationSubscription;

  GeolocationBloc({required GeolocationRepository geolocationRepository})
      : _geolocationRepository = geolocationRepository,
        super(GeolocationInitial()) {
    on<LoadGeolocation>((event, emit) async {
      emit(GeolocationLoading());
      _geolocationSubscription?.cancel();

      try {
        LocationPermission permission;
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.whileInUse) {
          final position = await _geolocationRepository.getCurrentLocation();
          add(UpdateGeolocation(position: position));
        } else {
          emit(GeolocationError());
        }
      } catch (error) {
        emit(GeolocationError());
      }
    });
    on<UpdateGeolocation>((event, emit) {
      emit(GeolocationLoaded(position: event.position));
    });
  }

  @override
  Future<void> close() {
    _geolocationSubscription?.cancel();
    return super.close();
  }
}
