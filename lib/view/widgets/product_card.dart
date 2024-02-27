import 'package:flutter/material.dart';
import 'package:market/routes.dart';

import '../../model/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        MyRouter.productDetailsRoute,
        arguments: product,
      ),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            height: 200,
            width: 150,
            child: Column(children: [
              const SizedBox(
                height: 5,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(4),
                child: Image.network(
                  product.thumbnail!,
                  fit: BoxFit.contain,
                ),
              )),
              const SizedBox(
                height: 5,
              ),
              Text(
                product.title ?? '',
                maxLines: 2,
                style: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${product.price} \$',
                maxLines: 1,
                style: const TextStyle(
                    color: Colors.pink, fontWeight: FontWeight.w500),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
