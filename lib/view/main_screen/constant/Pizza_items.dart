import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PizzaItems extends StatelessWidget {
  final String img;
  final String name;
  final IconData star;
  final double price;
  final String rating;
  final int? quantity;

  PizzaItems({
    Key? key,
    required this.img,
    required this.name,
    required this.rating,
    required this.price,
    required this.star,
    this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final commonTextStyle = GoogleFonts.lato(
      color: Colors.black.withOpacity(1),
      fontWeight: FontWeight.bold,
    );

    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 7),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            // Add your desired decoration properties here
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Image.network(
                img,
                width: MediaQuery.of(context).size.width / 3.4,
                height: 150, // Adjust the height as needed
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              name,
              style: commonTextStyle.copyWith(fontSize: 19),
            ),
            SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
      ),
    );
  }
}
