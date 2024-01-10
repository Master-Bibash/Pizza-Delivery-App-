import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/detail_screen/detail_screen.dart';
import 'package:flutter_application_1/view/main_screen/constant/Lists_pizza.dart';
import 'package:flutter_application_1/view/main_screen/constant/Pizza_items.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            slivers: [  SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              sliver: SliverGrid.builder(
                itemCount: pizza.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 0.5,
                    // mainAxisExtent: 0.1,
                    mainAxisSpacing: 0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(pizzaItem: pizza[index]),
                          ));
                    },
                    child: Hero(
                      
                      tag: pizza[index],
                      child: pizza[index],
                    ),
                  );
                },
              ),
            ),],
          )
      )
    
    );
  }
}
