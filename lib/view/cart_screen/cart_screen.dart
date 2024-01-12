import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/state_management/user_added_pizza_model.dart';
import 'package:flutter_application_1/view/cart_screen/components/add_to_cart.dart';
import 'package:flutter_application_1/view/detail_screen/Components/Button_Widgets.dart';
import 'package:flutter_application_1/view/main_screen/main_screen.dart';
import 'package:flutter_application_1/view/utils/colors_constant.dart';
import 'package:flutter_application_1/view/Cubit/PizzaItemCubit.dart';
import 'package:flutter_application_1/view/detail_screen/detail_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatefulWidget {
  CartScreen({
    super.key,
    required this.oldprice,
  });
  final int oldprice;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // List<useraddedpizza> pizzalist = context.watch<CartCubit>().state;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            pinned: false,

            // backgroundColor: Color(0xFFF4F5F0),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_rounded),
            ),
            centerTitle: true,
            title: Text(
              "Order Details",
              style: GoogleFonts.tajawal(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 24),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(
                  color: Theme.of(context).primaryColor,

                  Icons.more_horiz,
                  // color: Colors.red,
                  size: 26,
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
              child: Container(
            margin: EdgeInsets.all(6),
            height: height * 0.52,
            child: BlocBuilder<CartCubit, List<useraddedpizza>>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    // print(lp.itemsCart.length);
                    //  print(  "oldpp count is ${state[index].count}"); //present count
                    //  print("price of now pizza is ${state[index].price}");  //present price
                    return CartItems(
                        count: state[index].count,
                        width: width,
                        oldPrice: widget.oldprice,
                        height: height,
                        text: state[index].title,
                        price: state[index].price,
                        img: state[index].image);

                    //  CartItem(
                    //     width: width,
                    //     height: height,
                    //     text: pizzalist[index].name,
                    //     price: pizzalist[index].price.toInt(),
                    //     img: pizzalist[index].img);
                  },
                );
              },
            ),
          )),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 22),

            sliver: SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Divider(
                    color: Color.fromARGB(255, 230, 227, 227),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  //cart item middle part
                  CartItemMiddlePart(
                      title: "Item",
                      order: context.read<CartCubit>().getcartItem().length),
                  CartItemMiddlePart(
                    title: "Price",
                    doller: "\$",
                    order: context.watch<CartCubit>().calculateTotalPrice(),
                  ),

                  CartItemMiddlePart(title: "Delivery", doller: "\$", order: 5),
                  Divider(
                    color: Color.fromARGB(255, 230, 227, 227),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CartItemMiddlePart(
                      title: "Total",
                      color: Theme.of(context).primaryColor,
                      doller: "\$",
                      Fsize: 34,
                      order: context.read<CartCubit>().getALlTotal()),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // margin: EdgeInsets.all(2),
                    clipBehavior: Clip.antiAlias,
                    width: width,
                    height: height / 13,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Color(0xFF191A1D),
                        boxShadow: [
                          // BoxShadow(
                          //     blurRadius: 100,
                          //     color: Colors.white,
                          //     spreadRadius: 70)
                        ]),
                    child: ButtonWidget(
                      text: "Add To Cart",
                      ontap: () {
                       showDialog(
        context: context,
        builder: (context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
                  child: Material(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: width,
                      height: height * 0.7,
                      padding: EdgeInsets.only(top: 20),
                      margin: EdgeInsets.only(bottom: 80),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Text(
                            "Thank you for",
                            style: GoogleFonts.ubuntu(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                                fontSize: 30),
                          ),
                          Text(
                            "your Order !",
                            style: GoogleFonts.ubuntu(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                                fontSize: 30),
                          ),
                          Lottie.asset(
                            "assets/animation/thank4.json",
                          ),
                          Text(
                            "Your pizza will arrive in",
                            style: GoogleFonts.ubuntu(
                              color: Color(0xFF5e5e60),
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          TweenAnimationBuilder<Duration>(
                              duration: Duration(minutes: 30),
                              tween: Tween(
                                  begin: Duration(minutes: 30),
                                  end: Duration.zero),
                              onEnd: () {
                                Text("Your order has come at your door step");
                              },
                              builder: (BuildContext con, Duration value,
                                  Widget? child) {
                                final minutes = value.inMinutes;
                                final seconds = value.inSeconds % 60;
                                return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.timer_outlined),
                                        Text(
                                          '$minutes:$seconds Mins',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.ubuntu(
                                              color: Color(0xFF6b6b6b),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15),
                                        )
                                      ],
                                    ));
                              }),

                          // Spacer(),
                          // Text(
                          //   "Click below to go back",
                          //   textAlign: TextAlign.center,
                          //   style: GoogleFonts.ubuntu(
                          //       color: Color(0xFF6b6b6b).withOpacity(0.5),
                          //       fontWeight: FontWeight.w600,
                          //       fontSize: 15),
                          // ),
                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.pop(context);
                          //   },
                          //   child: Icon(Icons.back_hand),
                          // )
                          // SizedBox(height: 12,),
                          Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  child: ElevatedButton(
                                      autofocus: false,
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Continue",
                                        style: GoogleFonts.ubuntu(
                                            color: Color(0xFF727272),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      )),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MainScreenPage(),
                                        ));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFee3964),
                                    elevation: 0,
                                  ),
                                  child: RichText(

                                      // textAlign: TextAlign.end,
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: "Home ",
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                    // WidgetSpan(child: sp),
                                    WidgetSpan(
                                      alignment: PlaceholderAlignment.middle,
                                      child: Icon(
                                        Icons.east,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    )
                                  ])))
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          )
        )
                       );
                    
                      }
                    ),
                  )
                ],
              ),
            ),
            // SliverPadding(padding: padding)
          )
        ],
      ),
    );
  }

  Row CartItemMiddlePart({
    required String title,
    required int order,
    String? doller,
    Color? color,
    double? Fsize,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.tajawal(
              color: color ?? Color(0xFF848484),
              fontWeight: FontWeight.w800,
              fontSize: 24),
        ),
        RichText(
            textAlign: TextAlign.center,
            //  strutStyle: StrutStyle(),
            text: TextSpan(children: [
              TextSpan(
                text: doller ?? '',
                style: GoogleFonts.tajawal(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "${order}",
                style: GoogleFonts.tajawal(
                    color: Theme.of(context).primaryColor,
                    fontSize: Fsize ?? 27,
                    fontWeight: FontWeight.bold),
              )
            ])),
      ],
    );
  }
}

// List<PizzaItems> pizza = [];

class CartItems extends StatefulWidget {
  CartItems({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.price,
    this.count,
    required this.img,
    required this.oldPrice,
  });

  final double width;
  final double height;
  final String text;
  final int price;
  int? count = 0;
  final String img;
  final int oldPrice;

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  int get totalItemPrice =>
      widget.price *
      context
          .read<CartCubit>()
          .state
          .firstWhere((item) => item.title == widget.text)
          .count;

  @override
  Widget build(BuildContext context) {
    // final double real = widget.price / widget.count!.toDouble();
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: widget.width,
      height: widget.height * 0.13,
      padding: EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 1),
            child: Image.network(
              widget.img,
              width: 150,
              height: 150,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.text,
                style: GoogleFonts.mochiyPopOne(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                ),
              ),
              Spacer(
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "\$${widget.price}",
                    style: GoogleFonts.mochiyPopOne(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: widget.width * 0.15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3,
                                  color: Color.fromRGBO(230, 237, 237, 1.0)),
                              shape: BoxShape.rectangle,
                              // color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                          child: IconButton(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(2),
                            onPressed: () {
                              // print("first price is $totalItemPrice");

                              if (widget.count != 0) {
                                context.read<CartCubit>().decrementItem(
                                    widget.text, widget.oldPrice);
                              }
                            },
                            icon: Icon(
                              Icons.remove,
                              color: Theme.of(context).primaryColor,
                              size: 15,
                            ),
                          )),
                      SizedBox(
                        width: widget.width * 0.020,
                      ),
                      Text(
                        "${context.read<CartCubit>().state.firstWhere((item) => item.title == widget.text).count}",
                        style: GoogleFonts.mochiyPopOne(
                          color: Theme.of(context).primaryColor,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(
                        width: widget.width * 0.020,
                      ),
                      Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: Color.fromRGBO(237, 237, 237, 1.0)),
                              shape: BoxShape.rectangle,
                              // color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                          child: IconButton(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(2),
                            onPressed: () {
                              context.read<CartCubit>().incrementItem(
                                    widget.text,
                                    widget.oldPrice,
                                    widget.count,
                                    widget.price,
                                  );
                            },
                            icon: Icon(
                              Icons.add,
                              color: Theme.of(context).primaryColor,
                              size: 15,
                            ),
                          )),
                    ],
                  )
                ],
              ),
              Spacer(
                flex: 2,
              )
            ],
          ),

          //  Spacer(
          //   flex: 1,
          // ),
        ],
      ),
    );
  }
}
