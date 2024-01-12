import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/state_management/user_added_pizza_model.dart';

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
      // print("updateCart is $updateCart");
      updateCart[index].count = count;
      updateCart[index].price = price;
      emit(updateCart);
    }
  }

int incrementItem(String? title, int? oldprice, int? Ccount, int? newprice) {
    int index = state.indexWhere((element) => element.title == title);
    if (index != -1) {
      List<useraddedpizza> updateCart = List.from(state);

      // Get the existing total of that specific item
      int existingTotal = updateCart[index].price * updateCart[index].count;

      // Update count and price
      updateCart[index].count = Ccount! + 1;
      updateCart[index].price = newprice! + oldprice!;

      // Update the total by subtracting the old total and adding the new total
      int total = calculateTotalPrice() -
          existingTotal +
          updateCart[index].price * updateCart[index].count;

      emit(updateCart);

      return total;
    }

    return 0; // Return 0 if the item is not found (shouldn't happen if used correctly)
  }


  void decrementItem(String title, int oldPrice) {
    int index = state.indexWhere((element) => element.title == title);
    if (index != -1 && state[index].count > 0) {
      List<useraddedpizza> updateCart = List.from(state);
      updateCart[index].count--;
      updateCart[index].price -= oldPrice;
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
      // print("pizza price is ${pizza.price}");
      total += pizza.price ; // Multiply by count
    }
    return total;
  }

  int getALlTotal() {
    int allTotal = calculateTotalPrice.call();
    if (allTotal == 0) {
      return allTotal;
    } else {
      return allTotal - 5;
    }
  }

  void toggleFavourite(String title) {
    int index = state.indexWhere((element) => element.title == title);
    if (index != -1) {
      List<useraddedpizza> updateCart = List.from(state);
      updateCart[index].isFavourite = !updateCart[index].isFavourite;
      emit(updateCart);
    }
  }
}
