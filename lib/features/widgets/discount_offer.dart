import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/resources/app_colors.dart';

class DiscountOffer extends StatelessWidget {
  const DiscountOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 135,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Get Winter Discount",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                )),
                Text(
                  "20% Off",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  )
                ),
                Text(
                  "For Children",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  )
                ),
              ],
            ),
            Image.asset("assets/images/child.png"),
          ],
        ),
      ),
    );
  }
}
