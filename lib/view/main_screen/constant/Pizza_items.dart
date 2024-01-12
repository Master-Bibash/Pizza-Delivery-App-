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
      color: Color(0xFFCFD6E6),
      fontWeight: FontWeight.bold,
    );

    return Container(
      // height: 200,
      margin: EdgeInsets.only( left: 6,right: 6,bottom: 10),
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
      color: Color(0xFF485367),
      borderRadius: BorderRadius.circular(20)
          // Add your desired decoration properties here
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Display the pizza image
          Image.network(
            img,
            // width: MediaQuery.of(context).size.width / 3.4,
            height: 120,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the price
              RichText(
                text: TextSpan(children: [
                  WidgetSpan(child: SizedBox(width: 20,)),
                  TextSpan(
                    text: "\$",
                    style: commonTextStyle.copyWith(letterSpacing: 3),
                  ),
                  TextSpan(
                    text: "$price",
                    style: commonTextStyle.copyWith(fontSize: 24),
                  ),
                                    WidgetSpan(
                      child: SizedBox(
                    width: 20,
                  )),

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
                  SizedBox(width: 20),
                ],
              ),
            ],
            
          ),
          SizedBox(
            height: 3,
          )
        ],
      ),
    );
  }
}
