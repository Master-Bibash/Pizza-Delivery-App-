import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/state_management/user_added_pizza_model.dart';
import 'package:flutter_application_1/view/cart_screen/components/Sliver_Appbar.dart';
import 'package:flutter_application_1/view/cart_screen/components/add_to_cart.dart';
import 'package:flutter_application_1/view/cart_screen/components/cart_item.dart';
import 'package:flutter_application_1/view/cart_screen/components/order_button_widget.dart';
import 'package:flutter_application_1/view/Cubit/PizzaItemCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CartScreen extends StatefulWidget {
  CartScreen({
    super.key,
     this.oldprice,
  });
  final int? oldprice;
    static String routeName = '/spalsh-screen';


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
          SliverAppBarWidget(),
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
                        oldPrice: widget.oldprice!,
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
                      order: context.read<CartCubit>().getcartItem().length,
                      context: context),
                  CartItemMiddlePart(
                    context: context,
                    title: "Price",
                    doller: "\$",
                    order: context.watch<CartCubit>().calculateTotalPrice(),
                  ),

                  CartItemMiddlePart(
                      context: context,
                      title: "Delivery",
                      doller: "\$",
                      order: 5),
                  Divider(
                    color: Color.fromARGB(255, 230, 227, 227),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CartItemMiddlePart(
                      context: context,
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
                    child: Button_widget_with_animation_widget(width: width, height: height)
                        
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

//   Row CartItemMiddlePart({
//     required String title,
//     required int order,
//     String? doller,
//     Color? color,
//     double? Fsize,
//   }) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: GoogleFonts.tajawal(
//               color: color ?? Color(0xFF848484),
//               fontWeight: FontWeight.w800,
//               fontSize: 24),
//         ),
//         RichText(
//             textAlign: TextAlign.center,
//             //  strutStyle: StrutStyle(),
//             text: TextSpan(children: [
//               TextSpan(
//                 text: doller ?? '',
//                 style: GoogleFonts.tajawal(
//                     color: Theme.of(context).primaryColor,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold),
//               ),
//               TextSpan(
//                 text: "${order}",
//                 style: GoogleFonts.tajawal(
//                     color: Theme.of(context).primaryColor,
//                     fontSize: Fsize ?? 27,
//                     fontWeight: FontWeight.bold),
//               )
//             ])),
//       ],
//     );
//   }
// }

// List<PizzaItems> pizza = [];

// class CartItems extends StatefulWidget {
//   CartItems({
//     super.key,
//     required this.width,
//     required this.height,
//     required this.text,
//     required this.price,
//     this.count,
//     required this.img,
//     required this.oldPrice,
//   });

//   final double width;
//   final double height;
//   final String text;
//   final int price;
//   int? count = 0;
//   final String img;
//   final int oldPrice;

//   @override
//   State<CartItems> createState() => _CartItemsState();
// }

// class _CartItemsState extends State<CartItems> {
//   int get totalItemPrice =>
//       widget.price *
//       context
//           .read<CartCubit>()
//           .state
//           .firstWhere((item) => item.title == widget.text)
//           .count;

//   @override
//   Widget build(BuildContext context) {
//     // final double real = widget.price / widget.count!.toDouble();
//     return Container(
//       margin: EdgeInsets.only(bottom: 20),
//       width: widget.width,
//       height: widget.height * 0.13,
//       padding: EdgeInsets.all(2),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 1, bottom: 1),
//             child: Image.network(
//               widget.img,
//               width: 150,
//               height: 150,
//             ),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 widget.text,
//                 style: GoogleFonts.mochiyPopOne(
//                   color: Theme.of(context).primaryColor,
//                   fontSize: 18,
//                 ),
//               ),
//               Spacer(
//                 flex: 2,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     "\$${widget.price}",
//                     style: GoogleFonts.mochiyPopOne(
//                       color: Theme.of(context).primaryColor,
//                       fontSize: 18,
//                     ),
//                   ),
//                   SizedBox(
//                     width: widget.width * 0.15,
//                   ),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Container(
//                           width: 25,
//                           height: 25,
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                                   width: 3,
//                                   color: Color.fromRGBO(230, 237, 237, 1.0)),
//                               shape: BoxShape.rectangle,
//                               // color: Colors.black,
//                               borderRadius: BorderRadius.circular(5)),
//                           child: IconButton(
//                             alignment: Alignment.center,
//                             padding: EdgeInsets.all(2),
//                             onPressed: () {
//                               // print("first price is $totalItemPrice");

//                               if (widget.count != 0) {
//                                 context.read<CartCubit>().decrementItem(
//                                     widget.text, widget.oldPrice);
//                               }
//                             },
//                             icon: Icon(
//                               Icons.remove,
//                               color: Theme.of(context).primaryColor,
//                               size: 15,
//                             ),
//                           )),
//                       SizedBox(
//                         width: widget.width * 0.020,
//                       ),
//                       Text(
//                         "${context.read<CartCubit>().state.firstWhere((item) => item.title == widget.text).count}",
//                         style: GoogleFonts.mochiyPopOne(
//                           color: Theme.of(context).primaryColor,
//                           fontSize: 13,
//                         ),
//                       ),
//                       SizedBox(
//                         width: widget.width * 0.020,
//                       ),
//                       Container(
//                           width: 25,
//                           height: 25,
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                                   width: 2,
//                                   color: Color.fromRGBO(237, 237, 237, 1.0)),
//                               shape: BoxShape.rectangle,
//                               // color: Colors.black,
//                               borderRadius: BorderRadius.circular(5)),
//                           child: IconButton(
//                             alignment: Alignment.center,
//                             padding: EdgeInsets.all(2),
//                             onPressed: () {
//                               context.read<CartCubit>().incrementItem(
//                                     widget.text,
//                                     widget.oldPrice,
//                                     widget.count,
//                                     widget.price,
//                                   );
//                             },
//                             icon: Icon(
//                               Icons.add,
//                               color: Theme.of(context).primaryColor,
//                               size: 15,
//                             ),
//                           )),
//                     ],
//                   )
//                 ],
//               ),
//               Spacer(
//                 flex: 2,
//               )
//             ],
//           ),

//           //  Spacer(
//           //   flex: 1,
//           // ),
//         ],
//       ),
//     );
//   }
// }
}
