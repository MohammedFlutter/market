import 'package:flutter/material.dart' hide Badge;
import 'package:market/constants/categories.dart';
import 'package:market/routes.dart';
import 'package:market/view/widgets/base_app_bar.dart';
import 'package:market/view/widgets/category_card.dart';
import 'package:market/view/widgets/custom_badge.dart';
import 'package:market/view/widgets/custom_drawer.dart';
import 'package:market/view/widgets/product_builder.dart';
import 'package:market/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final homeViewModel = context.read<HomeViewModel>();

    homeViewModel.fetchProducts(
      context: context,
    );
    homeViewModel.fetchTotalQuantity();
    homeViewModel.fetchUser(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final homeViewModel = context.read<HomeViewModel>();
    homeViewModel.fetchTotalQuantity();
  }

  @override
  Widget build(BuildContext context) {
    final states = context.watch<HomeViewModel>();
    return Scaffold(
        drawer: CustomDrawer(user: states.userInfo),
        appBar: BaseAppBar(
          appBar: AppBar(),
          title: "Home",
          widgets: [
            CustomBadge(
              showBadge: states.totalQuantity > 0,
              badgeContent: Text("${states.totalQuantity}"),
              child: IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, MyRouter.cartRoute),
                icon: const Icon(Icons.shopping_cart),
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: _onRefresh,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Categories :",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SingleChildScrollView(
                controller: ScrollController(),
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: Category.categories
                        .map((e) => CategoryCard(category: e))
                        .toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Product :",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, MyRouter.productsRoute),
                      child: const Text(
                        "see all",
                        style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.w300,
                            fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              context.watch<HomeViewModel>().products == null
                  ? const Center(child: CircularProgressIndicator())
                  : ProductsBuilder(
                      products: context.watch<HomeViewModel>().products,
                    ),
            ],
          ),
        ));
  }

  Future<void> _onRefresh() {
    final homeViewModel = context.read<HomeViewModel>();
    return Future.wait([
      homeViewModel.fetchProducts(
        context: context,
      ),
      homeViewModel.fetchTotalQuantity(),
      homeViewModel.fetchUser(context),
    ]);
  }
}
