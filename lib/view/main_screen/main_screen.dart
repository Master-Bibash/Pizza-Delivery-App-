import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/view/main_screen/Components/drawer_widget.dart';
import 'package:flutter_application_1/view/detail_screen/detail_screen.dart';
import 'package:flutter_application_1/view/main_screen/Cursor_Cubit/CursorCubit.dart';
import 'package:flutter_application_1/view/main_screen/constant/Lists_pizza.dart';
import 'package:flutter_application_1/view/main_screen/constant/image_list.dart';
import 'package:flutter_application_1/view/view_all_screen/view_all_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({Key? key}) : super(key: key);
  static String routeName = '/main-screen';

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
      backgroundColor: Color(0xFF272D3B),
      body: SafeArea(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              backgroundColor: Color(0xFF272D3B),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 25,
                    ))
              ],
              elevation: 0,
              centerTitle: true,
              expandedHeight: 50,
              leading: Builder(builder: (BuildContext ctx) {
                return IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Theme.of(ctx).primaryColor,
                  ),
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
                            color: Theme.of(context).primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      items: items
                          .map((String item) =>
                              DropdownMenuItem(value: item, child: Text(item)))
                          .toList(),
                      value: selectedCity,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      elevation: 0,
                      icon: Icon(Icons.keyboard_arrow_down_rounded,
                          color: Theme.of(context).primaryColor,
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
                  color: Colors.white,
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
                              ? Color(0xFF9299A9)
                              : Color(0xFF9299A9)),
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
                      borderSide: BorderSide(
                          width: 2, color: Colors.grey.withOpacity(0.9)),
                    ),
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
                    hintText: "Find your pizza here..."),
              ),
            )),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Popular",
                        style: GoogleFonts.openSans(
                          fontSize: 22,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w700,
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, ViewScreen.routeName);
                        },
                        child: Text(
                          "View All",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ))
                  ],
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              sliver: SliverGrid.builder(
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 0.0,

                    // mainAxisExtent: 0.2,
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
          backgroundColor: Theme.of(context).primaryColor,
          child: SafeArea(
              child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                accountName: Text(
                  "Bibash Mishra",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                accountEmail: Text(
                  "bibash@gmail.com",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                currentAccountPictureSize: Size(80, 80),
                currentAccountPicture: CircleAvatar(
                  // radius: 90,

                  backgroundImage: NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/2/2f/Alesso_profile.png"),
                ),
              ),
              DrawerWidget(
                icon: Icons.home,
                text: "Home",
              ),
              DrawerWidget(
                icon: Icons.settings,
                text: "Settings",
              ),
              DrawerWidget(
                icon: Icons.person,
                text: "Profile",
              ),
              Spacer(
                flex: 5,
              ),
              DrawerWidget(
                icon: Icons.logout,
                text: "Logout",
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ))),
    );
  }
}
