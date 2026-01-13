import 'package:final_flutter_project/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../home/view.dart';
import '../profile/view.dart';
import '../search/view.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key, this.selectedIndex = 0});

  final int selectedIndex;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();

    setState(() {
      selectedPageIndex = widget.selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        backgroundColor: secondaryColor,
        indicatorColor: Colors.transparent,
        overlayColor: WidgetStatePropertyAll(
          Colors.grey.shade300
        ),
        onDestinationSelected: (int index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        selectedIndex: selectedPageIndex,
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
              colorFilter: ColorFilter.mode(
                selectedPageIndex == 0 ? primaryColor : Color(0xff9E9E9E),
                BlendMode.srcIn,
              ),
              width: 24,
              height: 24,
            ),
            label: "Home",
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              colorFilter: ColorFilter.mode(
                selectedPageIndex == 1 ? primaryColor : Color(0xff9E9E9E),
                BlendMode.srcIn,
              ),
              width: 24,
              height: 24,
            ),
            label: "Search",
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              colorFilter: ColorFilter.mode(
                selectedPageIndex == 2 ? primaryColor : Color(0xff9E9E9E),
                BlendMode.srcIn,
              ),
              width: 24,
              height: 24,
            ),
            label: "Cart",
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              "assets/icons/profile.svg",
              colorFilter: ColorFilter.mode(
                selectedPageIndex == 3 ? primaryColor : Color(0xff9E9E9E),
                BlendMode.srcIn,
              ),
              width: 24,
              height: 24,
            ),
            label: "Profile",
          ),
        ],
      ),
      body: [
        HomeScreen(),
        SearchScreen(),
        SearchScreen(),  // placeholder until cart is implemented
        ProfileScreen(),
      ][selectedPageIndex],
    );
  }
}
