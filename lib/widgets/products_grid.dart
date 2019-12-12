import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:u_shop/providers/products.dart';
import 'package:u_shop/widgets/product_tile.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final productList = productData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: productList.length,
      itemBuilder: (BuildContext context, int index) {
        print(
            "index is $index ${productList[index].title} isFavoriteStatus: ${productList[index].isFavourite}");
        return ChangeNotifierProvider.value(
          value: productList[index],
          //create: (_) => productList[index],
          child: ProductTile(),
        );
      },
    );
  }
}
