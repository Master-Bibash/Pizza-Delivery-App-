import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors_constant.dart';
import 'package:flutter_application_1/view/main_screen/Cubit/CursorCubit.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({Key? key}) : super(key: key);

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final CarouseCubit carouselCubit = CarouseCubit();

  final List<String> items = ["Nepal", "Bhutan", "Pakistan", "China", "Iraq"];
  String? selectedCity;
  int selectedId = 0;

  final StreamController<int> _indexStreamController =
      StreamController<int>.broadcast();
  // final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _indexStreamController.close();
    super.dispose();
  }

  bool _isFocused = false;

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List imageList = [
      {
        'id': 1,
        "image_path":
            'https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
      },
      {
        'id': 2,
        "image_path":
            'https://images.unsplash.com/photo-1490717064594-3bd2c4081693?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
      },
      {
        'id': 3,
        "image_path":
            'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
      }
    ];
    List<PizzaItems> pizza = [
      PizzaItems(
        width: width,
        img:
            'https://i0.wp.com/bestmargheritapizza.com/wp-content/uploads/2016/10/margherita-2.png?fit=2746%2C2767&ssl=1',
        name: "Margherita Italian",
        price: 80,
        rating: "4",
        star: Icons.star_rate_rounded,
      ),
      PizzaItems(
        width: width,
        img:
            'https://i0.wp.com/bestmargheritapizza.com/wp-content/uploads/2016/10/margherita-2.png?fit=2746%2C2767&ssl=1',
        name: "Margherita Italian",
        price: 80,
        rating: "4",
        star: Icons.star_rate_rounded,
      ),
      PizzaItems(
        width: width,
        img:
            'https://i0.wp.com/bestmargheritapizza.com/wp-content/uploads/2016/10/margherita-2.png?fit=2746%2C2767&ssl=1',
        name: "Margherita Italian",
        price: 80,
        rating: "4",
        star: Icons.star_rate_rounded,
      ),
      PizzaItems(
        width: width,
        img:
            'https://i0.wp.com/bestmargheritapizza.com/wp-content/uploads/2016/10/margherita-2.png?fit=2746%2C2767&ssl=1',
        name: "Margherita Italian",
        price: 80,
        rating: "4",
        star: Icons.star_rate_rounded,
      ),
    ];
    final CarouselController carouselController = CarouselController();
    return Scaffold(
      backgroundColor: ColorConstant.primary,
      body: SafeArea(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none_rounded,
                      size: 25,
                    ))
              ],
              elevation: 0,
              centerTitle: true,
              expandedHeight: 50,
              leading: Builder(builder: (BuildContext ctx) {
                return IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(ctx).openDrawer();
                  },
                );
              }),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: Colors.red,
                    size: 23,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.white,
                      isExpanded: false,
                      alignment: Alignment.centerLeft,
                      hint: Text(
                        "Beksi",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      items: items
                          .map((String item) =>
                              DropdownMenuItem(value: item, child: Text(item)))
                          .toList(),
                      value: selectedCity,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      elevation: 0,
                      icon: Icon(Icons.keyboard_arrow_down_rounded,
                          color: Colors.black,
                          textDirection: TextDirection.values.first),
                      iconSize: 20,
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value;
                        });
                      },
                    ),
                  ),

                  // Dropdown
                ],
              ),
            ),
            SliverList.list(
              children: [
                CarouselSlider(
                  carouselController: carouselController,
                  items: imageList
                      .map((item) => Container(
                            width: width,
                            margin: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      item['image_path'],
                                      // fit: BoxFit.cover,
                                      // width: width,
                                    )),
                                borderRadius: BorderRadius.circular(30)),
                            // Image.network(

                            //     ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    disableCenter: false,
                    scrollPhysics: BouncingScrollPhysics(),
                    height: 220.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 0,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 1,
                  ),
                ),
                // StreamBuilder<int>(
                //   stream: _indexStreamController.stream,
                //   builder: (context, snapshot) {
                //     int currentIndex = snapshot.data ?? 0;
                //     return Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: List.generate(3, (index) {
                //         debugPrint("Debug: index is $index");
                //         return Container(
                //           width: currentIndex == index ? 17 : 7,
                //           height: 7,
                //           margin: EdgeInsets.symmetric(horizontal: 4),
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10),
                //             color: currentIndex == index ? Colors.red : Colors.teal,
                //           ),
                //         );
                //       }),
                //     );
                //   },
                // ),
              ],
            ),
            SliverToBoxAdapter(
                child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),

              width: width,
              // height: 100,
              child: TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                onSubmitted: (String value) {
                  setState(() {
                    _isFocused = false;
                  });
                },
                onChanged: (String value) {
                  setState(() {
                    _isFocused = value.isNotEmpty;
                  });
                },
                onTap: () {
                  setState(() {
                    _isFocused = true;
                  });
                },
                textInputAction: TextInputAction.done,
                enableSuggestions: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 12),
                      child: Icon(Icons.search_sharp,
                          size: 30,
                          color: _isFocused
                              ? Colors.black
                              : Colors.grey.withOpacity(0.9)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          // style: BorderStyle.none,
                          width: 2,
                          color: Colors.grey.withOpacity(0.4)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
                    hintText: "Find your pizza here..."),
              ),
            )),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Popular",
                        style: GoogleFonts.openSans(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        )),
                    Text(
                      "View All",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.black.withOpacity(0.4)),
                    )
                  ],
                ),
              ),
            ),
            SliverGrid.builder(
              itemCount: pizza.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  // crossAxisSpacing: 0.1,
                  // mainAxisExtent: 1,
                  mainAxisSpacing: 0),
              itemBuilder: (context, index) {
                return Card(
                      //  margin: EdgeInsets.symmetric(horizontal: 20),


                    color: Colors.grey[90],
                  
                    child: pizza[index],
                    );
              },
            ),
            // SliverToBoxAdapter(
            //   child: SizedBox(
            //     height: 20,
            //   ),
            // )
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          width: 250,
          // Drawer content goes here
        ),
      ),
    );
  }
}

class PizzaItems extends StatelessWidget {
  const PizzaItems({
    super.key,
    required this.width,
    required this.img,
    required this.name,
    required this.rating,
    required this.price,
    required this.star,
  });

  final double width;
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
          padding: EdgeInsets.symmetric(horizontal: 5),
          // color: Colors.red,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                img,
                width: width / 3.4,
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
