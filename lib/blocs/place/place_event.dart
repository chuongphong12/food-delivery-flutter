part of 'place_bloc.dart';

abstract class PlaceEvent extends Equatable {
  const PlaceEvent();

  @override
  List<Object> get props => [];
}

class LoadedPlace extends PlaceEvent {
  final String placeId;

  const LoadedPlace({required this.placeId});

  @override
  List<Object> get props => [placeId];
}
