import 'package:flutter/material.dart';
import 'package:market/model/product.dart';
import 'package:market/viewmodel/product_details_view_model.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);
  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
    final event = context.read<ProductDetailsViewModel>();
    event.fetchQuantity();
    event.fetchProduct(context: context);
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = context.watch<ProductDetailsViewModel>().product;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            tooltip: "back",
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context)),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Text(
                  "${product.rating}",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                )
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(width: MediaQuery.of(context).size.width,),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(product.thumbnail ?? ''),
                        fit: BoxFit.contain)),
              ),
            )),

            const SizedBox(
              height: 10,
            ),
            Text(
              product.title ?? "",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "(${product.brand})",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: 4,
            ),
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: 'price : ',
                      style: Theme.of(context).textTheme.titleSmall),
                  TextSpan(
                      text: '${product.price} \$',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.black)),
                  TextSpan(
                      text:
                          '     After discount : ${(product.price! - product.price! * (product.discountPercentage ?? 0) * 0.01).toInt()} \$ ',
                      style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ),
            Text(
              "Description : ",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                product.description ?? "No description ",
                style: Theme.of(context).textTheme.labelMedium,
                maxLines: 4,
              ),
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Stock : ${product.stock}"),
                    IconButton(
                        onPressed: (context
                                    .watch<ProductDetailsViewModel>()
                                    .quantity ==
                                null)
                            ? null
                            : context.read<ProductDetailsViewModel>().increment,
                        icon: const Icon(Icons.add)),
                    Text(
                      context
                          .watch<ProductDetailsViewModel>()
                          .quantity
                          .toString(),
                    ),
                    IconButton(
                        onPressed: (context
                                    .watch<ProductDetailsViewModel>()
                                    .quantity ==
                                null)
                            ? null
                            : context.read<ProductDetailsViewModel>().decrement,
                        icon: const Icon(Icons.remove)),
                  ],
                ),
              ),
              Expanded(child: buildAddToCartButton(context)),
              const SizedBox(
                width: 20,
              )
            ]),
            // product.
          ],
        ),
      ),
    );
  }

  ElevatedButton buildAddToCartButton(BuildContext context) {
    final quantity = context.watch<ProductDetailsViewModel>().quantity;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: (quantity == null || quantity <= 0)
            ? null
            : () => context.read<ProductDetailsViewModel>().addToCart(context),
        child: const Text("add To cart"));
  }
}
