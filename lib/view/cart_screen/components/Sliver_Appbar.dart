import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      pinned: false,

      // backgroundColor: Color(0xFFF4F5F0),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_rounded,
          color: Theme.of(context).primaryColor,
        ),
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
            Icons.more_horiz,
            color: Theme.of(context).primaryColor,
            size: 26,
          ),
        ),
      ],
    );
  }
}
