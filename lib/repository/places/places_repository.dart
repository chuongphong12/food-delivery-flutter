import 'dart:async';
import 'dart:convert';

import 'package:food_delivery_app_flutter/constants/api_contants.dart';
import 'package:food_delivery_app_flutter/models/place_autocomplete_model.dart';
import 'package:food_delivery_app_flutter/models/place_model.dart';
import 'package:food_delivery_app_flutter/repository/places/base_places_repository.dart';
import 'package:http/http.dart' as http;

class PlacesRepository extends BasePlacesRepository {
  final String types = 'geocode';
  @override
  Future<List<PlaceAutocomplete>> getAutocomplete(String searchInput) async {
    final String url = '$placeAutocompleteUrl$searchInput&types=$types&key=$iosApiKey';
    List<PlaceAutocomplete> places;
    try {
      final response = await http.get(Uri.parse(url));
      final json = jsonDecode(response.body);
      final result = json['predictions'] as List;

      places = result.map((place) => PlaceAutocomplete.fromJson(place)).toList();
      return places;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Place> getPlace(String placeId) async {
    final String url = '$placeUrl$placeId&key=$iosApiKey';
    try {
      final response = await http.get(Uri.parse(url));
      final json = jsonDecode(response.body);
      final result = json['result'] as Map<String, dynamic>;

      return Place.fromJson(result);
    } catch (error) {
      rethrow;
    }
  }
}
