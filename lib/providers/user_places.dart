import 'package:favorite_places/models/place.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

class FavoritePlacesNotifier extends StateNotifier<List<Place>> {
  FavoritePlacesNotifier() : super(const <Place>[]);

  void addPlace(String title) {
    state = [...state, Place(title: title)];
  }

  void removePlace(String title) {
    state = state.where((element) => element.title != title).toList();
  }
}

final userPlacesProvider =
    StateNotifierProvider<FavoritePlacesNotifier, List<Place>>(
        (ref) => FavoritePlacesNotifier());
