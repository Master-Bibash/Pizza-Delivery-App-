
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/main_screen/constant/Pizza_items.dart';

List<PizzaItems> pizza = [
  const PizzaItems(
    
    img: 'https://hotpake.ca/image/menus/6.png',
    name: "Margherita Italian",
    price: 80,
    rating: "4",
    star: Icons.star_rate_rounded,
  ),
  const PizzaItems(
    img: 'https://hotpake.ca/image/menus/3.png',
    name: "ZUCCHINI PIZZA",
    price: 90,
    rating: "2",
    star: Icons.star_half_rounded,
  ),
  const PizzaItems(
    img: 'https://hotpake.ca/image/menus/2.png',
    name: "Margherita Italian",
    price: 190,
    rating: "9",
    star: Icons.star_rate_rounded,
  ),
  const PizzaItems(
    img:
        'https://i0.wp.com/bestmargheritapizza.com/wp-content/uploads/2016/10/margherita-2.png?fit=2746%2C2767&ssl=1',
    name: "Margherita Italian",
    price: 60,
    rating: "3",
    star: Icons.star_half_outlined,
  ),
];
