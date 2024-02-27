import 'package:flutter/material.dart';
import 'package:market/view/widgets/base_app_bar.dart';
import 'package:market/view/widgets/item_cart_card.dart';
import 'package:market/viewmodel/cart_view_model.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
     context.read<CartViewModel>().fetchCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(title: "Cart", appBar: AppBar()),
        body: context.watch<CartViewModel>().cart == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : context.watch<CartViewModel>().cart!.products!.isEmpty
                ? Center(
                    child: Text(
                      "No Item in Cart",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "totalQuantity : ${context.watch<CartViewModel>().cart!.totalQuantity}",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Expanded(
                          child: ListView(
                            children: context
                                .read<CartViewModel>()
                                .cart!
                                .products!
                                .map((e) => ItemCartCard(product: e))
                                .toList(),
                          ),
                        ),
                        Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      " \$ ${(context.watch<CartViewModel>().cart?.discountedTotal ?? 0).toInt()} ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    Text(
                                      " \$ ${(context.watch<CartViewModel>().cart?.total ?? 0).toInt()} ",
                                      style: const TextStyle(
                                          color: Colors.black38,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: Colors.pink),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 3,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                      onPressed: context
                                                  .watch<CartViewModel>()
                                                  .cart ==
                                              null
                                          ? null
                                          : () => context
                                              .read<CartViewModel>()
                                              .checkout(context),
                                      child: const Text("Check Out")),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ));
  }
}
