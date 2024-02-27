import 'package:flutter/material.dart' hide Badge;
import 'package:market/routes.dart';
import 'package:market/view/widgets/custom_badge.dart';
import 'package:market/viewmodel/products_view_model.dart';
import 'package:provider/provider.dart';
import '../widgets/base_app_bar.dart';
import '../widgets/product_builder.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key, this.category}) : super(key: key);
  final String? category;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    final states = context.read<ProductsViewModel>();
    states.fetchProducts(
        context: context, category: widget.category);
    states.fetchTotalQuantity();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<ProductsViewModel>().fetchTotalQuantity();
  }

  @override
  Widget build(BuildContext context) {
    final states = context.watch<ProductsViewModel>();

    return Scaffold(
        appBar: BaseAppBar(
            title: widget.category ?? "All Product",
            appBar: AppBar(),
            widgets: [
              CustomBadge(

                showBadge: states.totalQuantity > 0,
                badgeContent: Text("${states.totalQuantity}"),
                child: IconButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, MyRouter.cartRoute),
                  icon: const Icon(Icons.shopping_cart),
                ),
              )
            ]),
        body: ProductsBuilder(products: states.products));
  }
}
