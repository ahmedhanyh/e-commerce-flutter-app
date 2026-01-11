import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:final_flutter_project/core/resources/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_flutter_project/features/home/cubit.dart';
import 'package:final_flutter_project/features/home/state.dart';
import 'package:final_flutter_project/features/widgets/discount_offer.dart';
import 'package:final_flutter_project/features/widgets/product_grid_item.dart';
import '../widgets/loading_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..getProducts(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomeLoading) {
            return LoadingScreen(message: "Fetching data...");
          } else if (state is HomeLoaded) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 24),
                  child: Column(
                    spacing: 24,
                    children: [
                      SafeArea(
                        child: ListTile(
                          leading: CircleAvatar(radius: 25),
                          title: Text(
                            "Hello!",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          subtitle: Text(
                            "Ahmed Hany",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          trailing: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Color(0xffF8F7F7),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/icons/notifications.svg",
                                width: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          fillColor: secondaryColor,
                          filled: true,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(16),
                            child: SvgPicture.asset("assets/icons/search.svg"),
                          ),
                          hintText: "Search here",
                          hintStyle: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff9B9999),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: secondaryColor
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: secondaryColor
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      DiscountOffer(),
                      Column(
                        spacing: 8,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Featured",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Text(
                                "See all",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 180,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.products.length,
                              separatorBuilder: (context, i) => SizedBox(width: 12,),
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 180,
                                  child: ProductGridItem(
                                    imageURL: "${state.products[index]["images"][0]}",
                                    title: "${state.products[index]["title"]}",
                                    price: "${state.products[index]["price"]}",
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        spacing: 8,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Categories",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Text(
                                "See all",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 180,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.products.length,
                              separatorBuilder: (context, i) => SizedBox(width: 12,),
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 180,
                                  child: ProductGridItem(
                                    imageURL: "${state.products[index]["images"][0]}",
                                    title: "${state.products[index]["title"]}",
                                    price: "${state.products[index]["price"]}",
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 12,)
                    ],
                  ),
                ),
              ),
            );
          }
          return Scaffold();
        },
      ),
    );
  }
}
