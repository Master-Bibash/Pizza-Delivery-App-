import 'package:flutter/material.dart';
import 'package:flutter_application_1/state_management/user_added_pizza_model.dart';
import 'package:flutter_application_1/view/Cubit/PizzaItemCubit.dart';
import 'package:flutter_application_1/view/cart_screen/cart_screen.dart';
import 'package:flutter_application_1/view/detail_screen/Components/Button_Widgets.dart';
import 'package:flutter_application_1/view/detail_screen/detail_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({
    super.key,
    required this.width,
    required this.height,
    required this.widget,
    required this.count,
    required this.price,
  });

  final double width;
  final double height;
  final DetailScreen widget;
  final int count;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        // top: 0,
        bottom: 10,
        right: 0.89,
        left: -5,
        child: Container(
          margin: EdgeInsets.all(26),
          clipBehavior: Clip.antiAlias,
          width: width,
          height: height / 12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Color(0xFF191A1D),
              boxShadow: [
                BoxShadow(
                    blurRadius: 500, color: Colors.white, spreadRadius: 60)
              ]),
          child: ButtonWidget(
            text: "Add To Cart",
            ontap: () {
              useraddedpizza pizza = useraddedpizza(
                  title: widget.pizzaItem.name,
                  image: widget.pizzaItem.img,
                  count: count,
                  price: price,
                  isFavourite: false);

              context.read<CartCubit>().addToCart(pizza);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CartScreen(oldprice: widget.pizzaItem.price.toInt()),
                ),
              );
            },
          ),
        ));
  }
}
