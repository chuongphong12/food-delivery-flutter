import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app_flutter/models/place_autocomplete_model.dart';
import 'package:food_delivery_app_flutter/repository/repositories.dart';
import 'package:rxdart/rxdart.dart';

part 'autocomplete_event.dart';
part 'autocomplete_state.dart';

class AutocompleteBloc extends Bloc<AutocompleteEvent, AutocompleteState> {
  final PlacesRepository _placesRepository;
  StreamSubscription? _streamSubscription;

  AutocompleteBloc({required PlacesRepository placesRepository})
      : _placesRepository = placesRepository,
        super(AutocompleteInitial()) {
    on<LoadAutocomplete>(
      (event, emit) async {
        _streamSubscription?.cancel();
        try {
          final List<PlaceAutocomplete> autocomplete =
              await _placesRepository.getAutocomplete(event.searchInput);
          emit(AutocompleteLoaded(places: autocomplete));
        } catch (error) {
          emit(AutocompleteError());
        }
      },
      transformer: ((events, mapper) {
        return events.debounceTime(const Duration(milliseconds: 400)).asyncExpand(mapper);
      }),
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
