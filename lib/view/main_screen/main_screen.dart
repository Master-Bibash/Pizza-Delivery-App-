import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/utils/colors_constant.dart';
import 'package:flutter_application_1/view/detail_screen/detail_screen.dart';
import 'package:flutter_application_1/view/main_screen/Cubit/CursorCubit.dart';
import 'package:flutter_application_1/view/main_screen/constant/Lists_pizza.dart';
import 'package:flutter_application_1/view/main_screen/constant/image_list.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({Key? key}) : super(key: key);

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final CarouseCubit carouselCubit = CarouseCubit();

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

    final CarouselController carouselController = CarouselController();
    return Scaffold(
      backgroundColor: ColorConstant.primary,
      body: SafeArea(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none_rounded,
                      size: 25,
                    ))
              ],
              elevation: 0,
              centerTitle: true,
              expandedHeight: 50,
              leading: Builder(builder: (BuildContext ctx) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(ctx).openDrawer();
                  },
                );
              }),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
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
                            margin: const EdgeInsets.all(15),
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
                    scrollPhysics: const BouncingScrollPhysics(),
                    height: 220.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 0,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
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
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),

              width: width,
              // height: 100,
              child: TextField(
                style: const TextStyle(
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
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
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
                      borderSide:
                          const BorderSide(width: 2, color: Colors.black),
                    ),
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
                    hintText: "Find your pizza here..."),
              ),
            )),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              sliver: SliverGrid.builder(
                itemCount: pizza.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 1.2,
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
                      child: Card(
                        // margin: const EdgeInsets.only(left: 20, bottom: 10),
                        color: Colors.grey.shade100.withOpacity(0.9),
                        child: pizza[index],
                      ),
                    ),
                  );
                },
              ),
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
          // backgroundColor: Colors.blue,
          child: SafeArea(
              child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),

            // margin: EdgeInsets.only(bottom: 10),

            accountName: Text("Bibash Mishra"),
            accountEmail: Text("bibash@gmail.com"),
            currentAccountPictureSize: Size(80, 80),

            currentAccountPicture: CircleAvatar(
              // radius: 90,

              backgroundImage: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/2/2f/Alesso_profile.png"),
            ),
          )
        ],
      ))),
    );
  }
}
