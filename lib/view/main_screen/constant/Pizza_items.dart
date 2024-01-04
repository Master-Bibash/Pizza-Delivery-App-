import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class PizzaItems extends StatelessWidget {
  const PizzaItems({
    super.key,
    required this.img,
    required this.name,
    required this.rating,
    required this.price,
    required this.star,
  });
  final String img;
  final String name;
  final IconData star;
  final double price;
  final String rating;
  // final Function()

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          // margin: EdgeInsets.symmetric(
          //   horizontal: 20,
          // ),
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(),
          // color: Colors.red,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                img,
                width: MediaQuery.of(context).size.width / 3.4,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Text(name,
                  style: GoogleFonts.roboto(color: Colors.black, fontSize: 15
                      // fontWeight: FontWeight.w400,
                      )),
              SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "\$",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          wordSpacing: 20,
                          color: Colors.black.withOpacity(1),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    TextSpan(
                      text: "$price",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black.withOpacity(1),
                          fontWeight: FontWeight.w500,
                          fontSize: 22),
                    )
                  ])),
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
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Colors.black.withOpacity(1),
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                      )
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
