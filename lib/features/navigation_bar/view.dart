import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../home/view.dart';
import '../profile/view.dart';
import '../search/view.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key, this.selectedIndex = 0 });

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
        onDestinationSelected: (int index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        selectedIndex: selectedPageIndex,
        destinations: [
          NavigationDestination(icon: SvgPicture.asset("assets/icons/home.svg"), label: "Home"),
          NavigationDestination(icon: SvgPicture.asset("assets/icons/search.svg"), label: "Search"),
          NavigationDestination(
            icon: SvgPicture.asset("assets/icons/cart.svg"),
            label: "Cart",
          ),
          NavigationDestination(
            icon: SvgPicture.asset("assets/icons/profile.svg"),
            label: "Profile",
          ),
        ],
      ),
      body: [HomeScreen(), SearchScreen(), SearchScreen(), ProfileScreen()][selectedPageIndex],
    );
  }
}