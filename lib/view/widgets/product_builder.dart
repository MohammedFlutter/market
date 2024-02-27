import 'package:flutter/material.dart';

import '../../model/product.dart';
import 'product_card.dart';

class ProductsBuilder extends StatelessWidget {
  const ProductsBuilder({Key? key, this.products}) : super(key: key);

  final List<Product>? products;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (products == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (products!.isEmpty) {
          return const Center(
            child: Text("No product available2"),
          );
        } else {
          return _buildGridView(products, context);
        }
      },
    );
  }

  Widget _buildGridView(List<Product>? products,BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraint) {

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            controller: ScrollController(),
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:  constraint.maxWidth ~/ 200,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
        childAspectRatio: 1.5,

        ),
            children: List.generate(
                products!.length, (index) => ProductCard(product: products[index])),
          ),
        );
      }
    );
  }
}
