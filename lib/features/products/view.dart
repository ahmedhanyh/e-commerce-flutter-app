import 'package:final_flutter_project/features/category_item/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/product_item.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key, required this.title, required this.items, this.isCategories = false});

  final String title;
  final items;
  final bool isCategories;

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
          title,
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
        child: GridView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            if (isCategories) {
              return CategoryItem(category: items[index]);
            } else {
              return ProductItem(product: items[index]);
            }
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
