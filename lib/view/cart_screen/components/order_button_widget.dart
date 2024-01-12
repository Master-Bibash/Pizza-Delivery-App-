import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/Cubit/PizzaItemCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
  // int get totalItemPrice => widget.price * (widget.count ?? 0);
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
                                color: Theme.of(context).primaryColor,
                              ),
                              shape: BoxShape.rectangle,
                              // color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                          child: IconButton(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(2),
                            onPressed: () {
                              // print("first price is $totalItemPrice");
                              // print("price is $totalItemPrice");
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
                        "${context.select((CartCubit cubit) => cubit.state.firstWhere((item) => item.title == widget.text).count)}",
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
                                color: Theme.of(context).primaryColor,
                              ),
                              shape: BoxShape.rectangle,
                              // color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                          child: IconButton(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(2),
                            onPressed: () {
                              //  print("price is $totalItemPrice");
                              print("rs is ${widget.oldPrice}"); //old price
                              print("new price is ${widget.price}");
                              print("count is ${widget.count}"); //old count
                          

                              context.read<CartCubit>().incrementItem(
                                  widget.text,
                                  widget.oldPrice,
                                  widget.count!.toInt(),
                                  widget.price);
                            },
                            icon: Icon(
                              color: Theme.of(context).primaryColor,
                              Icons.add,
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
