import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/main_screen/constant/Pizza_items.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.pizzaItem});

  final PizzaItems pizzaItem;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double widgetWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_rounded),
              ),
              centerTitle: true,
              title: Text(
                "Order Details",
                style: GoogleFonts.roboto(),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.favorite_rounded,
                    color: Colors.red,
                    size: 25,
                  ),
                ),
              ],
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      width: widgetWidth / 2,
                      child: Image.network(widget.pizzaItem.img),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
