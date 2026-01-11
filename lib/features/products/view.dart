import 'package:final_flutter_project/features/products/cubit.dart';
import 'package:final_flutter_project/features/products/state.dart';
import 'package:final_flutter_project/features/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/product_grid_item.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductsCubit()..getProducts(),
      child: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<ProductsCubit>();
          if (state is ProductsLoading) {
            return LoadingScreen(message: "Fetching products...");
          } else if (state is ProductsLoaded) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffF8F7F7),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(child: SvgPicture.asset("assets/icons/arrow_back.svg", width: 18,)),
                    // child: Icon(Icons.arrow_back),
                  ),
                ),
                title: Text(
                  "Products",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                centerTitle: true,
                elevation: 0,
                scrolledUnderElevation: 0,
              ),
              // TODO: flutter_staggered_grid_view
              body: Padding(
                padding: const EdgeInsets.fromLTRB(12, 20, 12, 0),
                child: GridView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      return ProductGridItem(
                        imageURL: "${state.products[index]["images"][0]}",
                        title: "${state.products[index]["title"]}",
                        price: "${state.products[index]["price"]}",
                      );
                    },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.9
                  ),
                ),
              ),
              // TODO: add spacing at the end
            );
          } return Scaffold();
        },
      ),
    );
  }
}
