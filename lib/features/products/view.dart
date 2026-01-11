import 'package:final_flutter_project/features/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/product_grid_item.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.products});

  final products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffF8F7F7),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/icons/arrow_back.svg",
                  width: 18,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          "Products",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      // TODO: flutter_staggered_grid_view
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
        child: GridView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductGridItem(product: products[index]);
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.9,
          ),
        ),
      ),
    );
  }
}
