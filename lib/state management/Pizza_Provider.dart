import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/view/main_screen/constant/Pizza_items.dart';

class PizzaOrderProvider extends ChangeNotifier {
  List<PizzaItems> orderdPizza = [];

  void orderPizza(PizzaItems pizzaTYpe) {
    orderdPizza.add(pizzaTYpe);
    notifyListeners();
  }
}
