import 'package:final_flutter_project/features/search/view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:final_flutter_project/core/resources/app_colors.dart';
import 'package:final_flutter_project/features/home/cubit.dart';
import 'package:final_flutter_project/features/home/state.dart';
import 'package:final_flutter_project/features/widgets/discount_offer.dart';
import 'package:final_flutter_project/features/widgets/product_item.dart';
import '../category_item/view.dart';
import '../navigation_bar/view.dart';
import '../products/view.dart';
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
                          contentPadding: EdgeInsets.all(0),
                          horizontalTitleGap: 8,
                          dense: true,
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: Color(0xffD9D9D9),
                            backgroundImage: AssetImage(
                              "assets/images/profile_picture.png",
                            ),
                          ),
                          title: Text(
                            "Hello!",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          subtitle: Text(
                            "Ahmed Hany",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
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
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return NavBar(
                                  selectedIndex: 1,
                                ); // 1 is the SearchScreen index in NavBar
                              },
                            ),
                          );
                        },
                        child: TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            fillColor: secondaryColor,
                            filled: true,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(16),
                              child: SvgPicture.asset(
                                "assets/icons/search.svg",
                              ),
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
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: secondaryColor),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        spacing: 8,
                        children: [
                          DiscountOffer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 4,
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Color(0xffB0AEAE),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Color(0xffB0AEAE),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Color(0xffB0AEAE),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
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
                                "Featured",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ListScreen(
                                          title: "Products",
                                          items: state.products,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Text(
                                  "See all",
                                  style: TextStyle(
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
                              separatorBuilder: (context, i) =>
                                  SizedBox(width: 12),
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 180,
                                  child: ProductItem(
                                    product: state.products[index],
                                    showAddBtn: false,
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
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ListScreen(
                                          title: "Categories",
                                          items: state.categories,
                                          isCategories: true,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Text(
                                  "See all",
                                  style: TextStyle(
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
                              itemCount: state.categories.length,
                              separatorBuilder: (context, i) =>
                                  SizedBox(width: 12),
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 180,
                                  child: CategoryItem(
                                    category: state.categories[index],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
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
