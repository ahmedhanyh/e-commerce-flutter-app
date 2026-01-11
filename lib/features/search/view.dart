import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/resources/app_colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: secondaryColor,
              filled: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset("assets/icons/search.svg"),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(14),
                child: SvgPicture.asset("assets/icons/search_cancel.svg",),
              ),
              hintText: "Search here",
              hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff9B9999),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: secondaryColor),
                borderRadius: BorderRadius.circular(30),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: secondaryColor),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          ),
        ),
      );
  }
}