import 'package:flutter/material.dart';
import 'package:market/routes.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
            context,
            MyRouter.productsRoute,
            arguments:category),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 120,
            width: 90,
            child: Column(children: [
              const SizedBox(
                height: 5,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(4),
                child: Image.asset(
                  "assets/$category.png",
                  fit: BoxFit.contain,
                ),
              )),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  category.replaceAll("-", " "),
                  maxLines: 2,
                  style:
                      const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
