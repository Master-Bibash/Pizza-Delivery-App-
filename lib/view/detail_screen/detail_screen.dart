import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/view/main_screen/constant/Pizza_items.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.pizzaItem});

  final PizzaItems pizzaItem;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _animation;
  @override
  void initState() {
    // TODO: implement initState
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 80));
    _animation = Tween<double>(begin: 0, end: 2 * 3.141).animate(_controller);
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
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
                  style: GoogleFonts.tajawal(
                      fontWeight: FontWeight.w800, fontSize: 24),
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
                padding: EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.001,
                      ),
                      AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: _animation.value,
                              child: SizedBox(
                                // width: width / 1.5,
                                // height: height / 3.3,
                                child: Hero(
                                  tag: widget.pizzaItem,
                                  child: CircleAvatar(
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    radius: 150,
                                    backgroundImage: NetworkImage(
                                      widget.pizzaItem.img,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(
                        widget.pizzaItem.name,
                        style: GoogleFonts.mochiyPopOne(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                WidgetSpan(
                                    alignment: PlaceholderAlignment.bottom,
                                    child: Icon(
                                      Icons.alarm_sharp,
                                      color: Colors.red.shade800,
                                      size: 22,
                                    )),
                                TextSpan(
                                  text: '15 Mins',
                                  style: GoogleFonts.tajawal(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                WidgetSpan(
                                    child: SizedBox(
                                  width: width * 0.06,
                                )),
                                WidgetSpan(
                                    alignment: PlaceholderAlignment.bottom,
                                    child: Lottie.asset(
                                        "assets/animation/flame.json")),
                                TextSpan(
                                  text: '32 0 Kal',
                                  style: GoogleFonts.tajawal(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                              text: TextSpan(children: [
                            WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Lottie.asset(
                                    width: 46,
                                    height: 65,
                                    "assets/animation/star.json")),
                            TextSpan(children: [
                              TextSpan(
                                text: '${widget.pizzaItem.rating} ',
                                style: GoogleFonts.tajawal(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: '(1.7K Reviews)',
                                style: GoogleFonts.tajawal(
                                    color: Color(0xFF7F7F7F),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ]))
                        ],
                      ),
                      Divider(
                        color: Color.fromARGB(255, 230, 227, 227),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      )
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                  child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           RichText(
                              textAlign: TextAlign.center,
                              //  strutStyle: StrutStyle(),
                              text: TextSpan(children: [
                                TextSpan(
                                  text: "\$",
                                  style: GoogleFonts.tajawal(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: widget.pizzaItem.price.toString(),
                                  style: GoogleFonts.tajawal(
                                      color: Colors.black,
                                      fontSize: 55,
                                      fontWeight: FontWeight.bold),
                                )
                              ])),
                                  Container(
                            width: width * 0.28,
                            height: height * 0.059,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromARGB(255, 221, 218, 218),
                                ),
                                color: Color.fromARGB(255, 255, 254, 254),
                                borderRadius: BorderRadius.circular(40)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    size: 30,
                                  ),
                                  onPressed: () {},
                                ),
                                Text("1",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700)),
                                Icon(
                                  Icons.add,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                         Text(
                        "About Pizza",
                        style: GoogleFonts.tajawal(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                               Text(
                        "Our next Zucchini Week recipe is all about the Italian spin: Zucchini Pizza Boats. This quick and easy dinner recipe is kid friendly (hello, PIZZA), adult approved (also PIZZA! plus a built-in serving of veggies and skinny topping options), and the kind of satisfying weeknight meal we all need more of in our lives,Our next Zucchini Week recipe is all about the Italian spin: Zucchini Pizza Boats. This quick and easy dinner recipe is kid friendly (hello, PIZZA), adult approved (also PIZZA! plus a built-in serving.",
                        // maxLines: 9,
                        style: GoogleFonts.dosis(
                            color: Color(0xFFADADAD),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: height*0.2,)
                      

                  ],),
                ),
              )
            ],
          )),
          Positioned(
              // top: 0,
              bottom: 35,
              // right: -20,

              child: Container(
                 margin: EdgeInsets.all( 4),

                clipBehavior: Clip.antiAlias,
                width: width,
                                              height: height / 12,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Color(0xFF191A1D),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 100,
                          color: Colors.white,
                          spreadRadius: 70)
                    ]),
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    clipBehavior: Clip.antiAlias,
                    onPressed: () {},
                    child: Text(
                      "Add To Cart",
                      style: TextStyle(color: Colors.white),
                    )),
              )) 
        ],
      ),
    );
  }
}
