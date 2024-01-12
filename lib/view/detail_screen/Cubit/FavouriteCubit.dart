import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCubit extends Cubit<List<String>> {
  FavouriteCubit() : super([]);
  void toggleFavourite(String title) {
    List<String> updateFavourite = List.from(state);
    if (updateFavourite.contains(title)) {
      updateFavourite.remove(title);
    } else {
      updateFavourite.add(title);
    }
    emit(updateFavourite);
  }
}
