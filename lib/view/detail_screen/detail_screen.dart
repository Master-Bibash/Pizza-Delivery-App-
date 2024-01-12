import 'package:flutter/material.dart';
import 'package:flutter_application_1/state_management/user_added_pizza_model.dart';
import 'package:flutter_application_1/view/detail_screen/Components/add_to_cart_widget.dart';
import 'package:flutter_application_1/view/detail_screen/Components/moddle_part_widget.dart';
import 'package:flutter_application_1/view/detail_screen/Cubit/FavouriteCubit.dart';
import 'package:flutter_application_1/view/main_screen/constant/Pizza_items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key,  this.pizzaItem});

  final PizzaItems? pizzaItem;
    static String routeName = '/detail-screen';


  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  int count = 0;
  int price = 0;

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

  // widget.pizzaItem.price
  List<useraddedpizza> userpizza = [];
  @override
  Widget build(BuildContext context) {
    // List<PizzaItems> pizzalist = context.watch<CartCubit>().state;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              child: CustomScrollView(
            slivers: [
              SliverAppBar(

                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_rounded,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                centerTitle: true,
                title: Text(
                  "Order Details",
                  style: GoogleFonts.tajawal(
                    color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w800, fontSize: 24),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: IconButton(onPressed: () {
                      context
                          .read<FavouriteCubit>()
                          .toggleFavourite(widget.pizzaItem!.name);
                    }, icon: BlocBuilder<FavouriteCubit, List<String>>(
                            builder: (context, state) {
                      bool isFavourite = state.contains(widget.pizzaItem!.name);
                      return isFavourite
                          ? Icon(
                              Icons.favorite_rounded,
                              color: Colors.red,
                              size: 26,
                            )
                          : Icon(
                              Icons.favorite_outline,
                              color: Theme.of(context).primaryColor,
                              size: 26,
                            );
                    })

                        // context.select((CartCubit cubit) => cubit.state
                        //         .firstWhere(
                        //             (item) => item.title == widget.pizzaItem.name)
                        //         .isFavourite
                        //     ? Icon(Icons.favorite_rounded)
                        //     : Icon(
                        //         Icons.favorite_outline,
                        //         color: Colors.red,
                        //         size: 26,
                        //       )),
                        ),
                  )
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
                                  tag: widget.pizzaItem!,
                                  child: CircleAvatar(
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    radius: 150,
                                    backgroundImage: NetworkImage(
                                      widget.pizzaItem!.img,
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
                        widget.pizzaItem!.name,
                        style: GoogleFonts.mochiyPopOne(
                          color: Theme.of(context).primaryColor,
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      //midle part like time and fire stars after pizza
                      mIddle_part_widget(width: width, widget: widget),
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
                                      color: Theme.of(context).primaryColor,
                                      
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: '${price}',
                                  style: GoogleFonts.tajawal(
                                     color: Theme.of(context).primaryColor,
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
                                // SizedBox(
                                //   width: width * 0.01,
                                // ),
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    if (count > 0) {
                                      setState(() {
                                        print(price);
                                        count--;
                                        price = price -
                                            widget.pizzaItem!.price.toInt();
                                      });
                                    } else {
                                      count;
                                      price;
                                    }

                                    // context.read<CartCubit>().decrementItem(widget.pizzaItem.name,price);
                                  },
                                ),
                                Text("${count}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      print(price);
                                      count++;
                                      price = price +
                                          widget.pizzaItem!.price.toInt();
                                    });
                                  },
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
                           color: Color.fromARGB(255, 221, 218, 218),
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Our next Zucchini Week recipe is all about the Italian spin: Zucchini Pizza Boats. This quick and easy dinner recipe is kid friendly (hello, PIZZA), adult approved (also PIZZA! plus a built-in serving of veggies and skinny topping options), and the kind of satisfying weeknight meal we all need more of in our lives,Our next Zucchini Week recipe is all about the Italian spin: Zucchini Pizza Boats. This quick and easy dinner recipe is kid friendly (hello, PIZZA), adult approved (also PIZZA! plus a built-in serving.",
                        // maxLines: 9,
                        style: GoogleFonts.dosis(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: height * 0.3,
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
          //add to cart button with position
          
          AddToCartWidget(width: width, height: height, widget: widget, count: count, price: price)
        ],
      ),
    );
  }
}

