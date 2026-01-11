import 'package:flutter/material.dart';
import 'package:final_flutter_project/core/resources/app_colors.dart';
import 'dart:math' as math;

class ProductGridItem extends StatefulWidget {
  const ProductGridItem({
    super.key,
    required this.imageURL,
    required this.title,
    required this.price,
  });

  final String imageURL;
  final String title;
  final String price;

  @override
  State<ProductGridItem> createState() => _ProductGridItemState();
}

class _ProductGridItemState extends State<ProductGridItem> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF8F7F7),
        borderRadius: BorderRadius.circular(12),
      ),
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
                    image: NetworkImage(widget.imageURL),
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
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // "${widget.title.substring(0, math.min(widget.title.length, 25))}...",  // another way to display title
                      "${widget.title}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "\$ ${widget.price}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Container(
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Icon(Icons.add, color: Colors.white,),
                ),
              ),
            ],
          ),
          // TODO: a different approach
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       "\$ ${widget.price}",
          //       style: TextStyle(
          //         fontSize: 12,
          //         fontWeight: FontWeight.w500,
          //         color: primaryColor,
          //       ),
          //     ),
          //     Container(
          //       decoration: BoxDecoration(
          //           color: primaryColor,
          //           borderRadius: BorderRadius.circular(50)
          //       ),
          //       child: Icon(Icons.add, color: Colors.white,),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
