import 'package:flutter_application_1/view/main_screen/constant/Pizza_items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PizzaItemCubit extends Cubit<List<PizzaItems>> {
  PizzaItemCubit() : super([]);
  void addItem(PizzaItems pizza) {
    state.add(pizza);
    emit(List.from(state));
  }
}
