import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/view/detail_screen/detail_screen.dart';

class CartCubit extends Cubit<List<useraddedpizza>> {
  CartCubit() : super([]);

  void addToCart(useraddedpizza pizza) {
    int existingIndex =
        state.indexWhere((element) => element.title == pizza.title);

    if (existingIndex != -1) {
      updatePizza(existingIndex, pizza.count, pizza.price);
    } else {
      emit([...state, pizza]);
    }
  }

  void updatePizza(int index, int count, int price) {
    if (index >= 0 && index < state.length) {
      List<useraddedpizza> updateCart = List.from(state);
      updateCart[index].count = count;
      updateCart[index].price = price;
      emit(updateCart);
    }
  }

  void incrementItem(String title, int oldprice, int Ccount, int newprice) {
    int index = state.indexWhere((element) => element.title == title);
    if (index != -1) {
      List<useraddedpizza> updateCart = List.from(state);
      updateCart[index].count = Ccount + 1;
      updateCart[index].price = newprice + oldprice; // Update the price here
      emit(updateCart);
    }
  }

  void decrementItem(String title, int oldPrice) {
    int index = state.indexWhere((element) => element.title == title);
    if (index != -1 && state[index].count > 0) {
      List<useraddedpizza> updateCart = List.from(state);
      updateCart[index].count--;
      updateCart[index].price -=
          oldPrice; // Subtract old price when decrementing
      emit(updateCart);
    }
  }

  List<useraddedpizza> getcartItem() {
    return state;
  }

  //calculate total price
  // Calculate total price considering individual counts
  int calculateTotalPrice() {
    int total = 0;
    for (useraddedpizza pizza in state) {
      total += pizza.price;
    }
    return total;
  }

  int getTotal() {
    int allTotal = 0;
    for (useraddedpizza pizza in state) {
      allTotal += pizza.price;
    }
    return allTotal-5;
  }
}
