import 'package:final_flutter_project/features/category_item/cubit.dart';
import 'package:final_flutter_project/features/category_item/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../products/view.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key, required this.category});

  final category;

  @override
  State<CategoryItem> createState() => _CategoryGridItemState();
}

class _CategoryGridItemState extends State<CategoryItem> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryItemCubit(),
      child: BlocConsumer<CategoryItemCubit, CategoryItemState>(
        listener: (context, state) {
          if (state is CategoryProductsLoaded) {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) {
                    return ListScreen(title: widget.category["name"], items: state.products,);
                  }
              )
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<CategoryItemCubit>();
          return Material(
            color: Color(0xffF8F7F7),
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: () {
                cubit.getCategoryProducts(widget.category["url"]);
              },
              highlightColor: Colors.grey.shade300,
              splashColor: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                child: Column(
                  spacing: 8,
                  children: [
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://picsum.photos/320/240"
                            // "https://loremflickr.com/320/240/${widget.category["slug"]}",
                            // "https://source.unsplash.com/featured/?${widget.category["slug"]}"
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "${widget.category["name"]}",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
