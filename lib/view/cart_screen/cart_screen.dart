import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors_constant.dart';
import 'package:flutter_application_1/view/Cubit/PizzaItemCubit.dart';
import 'package:flutter_application_1/view/Cubit/global_list/global.dart';
import 'package:flutter_application_1/view/detail_screen/detail_screen.dart';
import 'package:flutter_application_1/view/main_screen/constant/Pizza_items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  CartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<PizzaItems> pizzalist = context.watch<PizzaItemCubit>().state;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // List<CartItems> p = [
    //   CartItems(
    //       width: width,
    //       height: height,
    //       text: "Cheese Pizza",
    //       price: 50,
    //       count: 1,
    //       img: "https://hotpake.ca/image/menus/6.png"),
    //   CartItems(
    //       width: width,
    //       height: height,
    //       text: "Cheese Pizza",
    //       price: 50,
    //       count: 1,
    //       img: "https://hotpake.ca/image/menus/6.png"),
    //   CartItems(
    //       width: width,
    //       height: height,
    //       text: "Cheese Pizza",
    //       price: 50,
    //       count: 1,
    //       img: "https://hotpake.ca/image/menus/6.png"),
    //   CartItems(
    //       width: width,
    //       height: height,
    //       text: "Cheese Pizza",
    //       price: 50,
    //       count: 1,
    //       img: "https://hotpake.ca/image/menus/6.png"),
    // ];
    ListofPizza lp = new ListofPizza();

    return Scaffold(
      backgroundColor: ColorConstant.primary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
                  fontWeight: FontWeight.w800, fontSize: 24),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(
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
            child: ListView.builder(
              itemCount: pizzalist.length,
              itemBuilder: (context, index) {
                // print(lp.itemsCart.length);
                return CartItems(
                    width: width,
                    height: height,
                    text: pizzalist[index].name,
                    price: pizzalist[index].price.toInt(),
                    img: pizzalist[index].img);
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
                  CartItemMiddlePart(title: "Item", text: "4"),
                  CartItemMiddlePart(title: "Price", doller: "\$", text: "240"),

                  CartItemMiddlePart(
                      title: "Delivery", doller: "\$", text: "4"),
                  Divider(
                    color: Color.fromARGB(255, 230, 227, 227),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CartItemMiddlePart(
                      title: "Total",
                      color: Colors.black,
                      doller: "\$",
                      Fsize: 34,
                      text: "244"),
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
                        print(lp.itemsCart.length);
                        // print("dpme");
                      },
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
    required String text,
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
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: text,
                style: GoogleFonts.tajawal(
                    color: Colors.black,
                    fontSize: Fsize ?? 27,
                    fontWeight: FontWeight.bold),
              )
            ])),
        //    Text(text,
        //  //  Color(0xFF222020);
        //        style: GoogleFonts.tajawal(
        //   color: Color(0xFF222020),
        //   fontWeight: FontWeight.w800,
        //   fontSize: 24),

        //   )

        // Color(0xFF848484);)
      ],
    );
  }
}

List<PizzaItems> pizza = [];

class CartItems extends StatefulWidget {
  CartItems({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.price,
    this.count,
    required this.img,
  });

  final double width;
  final double height;
  final String text;
  final int price;
  int? count = 0;
  final String img;

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
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
                              setState(() {
                                widget.count=widget.count?? 1 +1;
                              });
                            },
                            icon: Icon(
                              Icons.add,
                              size: 15,
                            ),
                          )),
                      SizedBox(
                        width: widget.width * 0.020,
                      ),
                      Text(
                        "${widget.count?? 0 }",
                        style: GoogleFonts.mochiyPopOne(
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
                              widget.count! > 0
                                  ? setState(() {
                                      widget.count=widget.count?? 0-1;
                                    })
                                  : widget.count?? 0;
                            },
                            icon: Icon(
                              Icons.remove,
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
