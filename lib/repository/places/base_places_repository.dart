import 'package:food_delivery_app_flutter/models/place_autocomplete_model.dart';
import 'package:food_delivery_app_flutter/models/place_model.dart';

class BasePlacesRepository {
  Future<List<PlaceAutocomplete>?> getAutocomplete(String searchInput) async {}
  Future<Place?> getPlace(String placeId) async {}
}
