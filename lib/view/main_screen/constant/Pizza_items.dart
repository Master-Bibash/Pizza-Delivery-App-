import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PizzaItems extends StatelessWidget {
  final int id;
  final String img;
  final String name;
  final IconData star;
  final double price;
  final String rating;
  int? quantity;

  PizzaItems({
    Key? key,
    required this.id,
    required this.img,
    required this.name,
    required this.rating,
    required this.price,
    required this.star,
    this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define a common text style using Google Fonts
    final commonTextStyle = GoogleFonts.lato(
      color: Colors.black.withOpacity(1),
      fontWeight: FontWeight.bold,
    );

    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 7),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          // Add your desired decoration properties here
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display the pizza image
          Image.network(
            img,
            // width: MediaQuery.of(context).size.width / 3.4,
            height: 150,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          // Display the pizza name
          Text(
            name,
            style: commonTextStyle.copyWith(fontSize: 19),
          ),
          SizedBox(height: 3),
          // Display the price and star rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Display the price
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "\$",
                    style: commonTextStyle.copyWith(letterSpacing: 3),
                  ),
                  TextSpan(
                    text: "$price",
                    style: commonTextStyle.copyWith(fontSize: 24),
                  ),
                ]),
              ),
              // Display the star rating
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    star,
                    color: Colors.orange,
                  ),
                  Text(
                    rating,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black.withOpacity(1),
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
