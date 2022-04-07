import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app_flutter/models/place_model.dart';
import 'package:food_delivery_app_flutter/repository/places/places_repository.dart';

part 'place_event.dart';
part 'place_state.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  final PlacesRepository _placesRepository;
  StreamSubscription? _streamSubscription;
  PlaceBloc({required PlacesRepository placesRepository})
      : _placesRepository = placesRepository,
        super(PlaceLoading()) {
    on<LoadedPlace>((event, emit) async {
      _streamSubscription?.cancel();
      emit(PlaceLoading());
      try {
        final Place place = await _placesRepository.getPlace(event.placeId);
        emit(PlaceLoaded(place: place));
      } catch (error) {
        emit(PlaceError());
      }
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
