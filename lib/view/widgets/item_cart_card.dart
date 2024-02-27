import 'package:flutter/material.dart';
import 'package:market/viewmodel/cart_view_model.dart';
import 'package:provider/provider.dart';

import '../../model/product.dart';

class ItemCartCard extends StatelessWidget {
  const ItemCartCard({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        child: ListTile(
          leading: Material(
            elevation: 3,
            child: CircleAvatar(
                backgroundColor: Colors.grey ,radius: 70,
                child: Image.network("${product.thumbnail}")),
          ),
          title: Text("${product.title}"),
          subtitle:Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            children: [
              Text("price   : \$ ${product.price}    "),
              Text("quantity:  ${product.quantity}   ",),
            ],
          ) ,
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed:() =>context.read<CartViewModel>().deleteProduct(product.id!)
          ),
        ),
      ),
    );
  }
}
