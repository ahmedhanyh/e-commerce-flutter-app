import 'package:final_flutter_project/features/product_details/view.dart';
import 'package:flutter/material.dart';
import 'package:final_flutter_project/core/resources/app_colors.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product, this.showAddBtn = true});

  final product;
  final bool showAddBtn;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xffF8F7F7),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ProductDetailsScreen(product: widget.product);
              },
            ),
          );
        },
        highlightColor: Colors.grey.shade300,
        splashColor: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 8,
            children: [
              Stack(
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.product["images"][0]),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          favorite = !favorite;
                        });
                      },
                      child: Icon(
                        favorite ? Icons.favorite : Icons.favorite_outline,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.product["title"]}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "\$ ${widget.product["price"]}",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (widget.showAddBtn)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.add, color: Colors.white),
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
}
